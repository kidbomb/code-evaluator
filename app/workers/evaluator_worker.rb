class EvaluatorWorker
  include Sidekiq::Worker

  def perform(submission_result_id)
    submission_result = SubmissionResult.includes(:submission).find(submission_result_id)

    #create temp dir
    tmp_dir = "/tmp/submission" + submission_result.submission_id.to_s
    system("mkdir " + tmp_dir)
    source_code_file = tmp_dir + "/code.c"
    solution_file = tmp_dir + "/solution"
 
    submission = submission_result.submission

    #create tem file
    File.open(source_code_file, "w+") do |f|
      f.write(submission.code)
    end

    #run build if needed
    language = Language.find(submission.language_id)
    if language.build_command != nil && language.build_command.length > 0 
      build_output = `#{language.build_command}  #{solution_file} #{source_code_file} 2>&1`
      build_ok = $?.success?
      submission_result.details = "Building..."
      puts "build_output=" + build_output
      submission_result.save
    else
      build_ok = true
    end

    if build_ok
      #report
      submission_result.details = "Build OK"
      submission_result.save

      test_cases = TestCase.find_all_by_problem_id(submission.problem_id)
      test_cases.each do |test_case|
        test_case_result = submission_result.test_case_results.new
        test_case_file = tmp_dir + "/test_case" +test_case.id.to_s
        
        File.open(test_case_file, "w+") do |f|
          f.write(test_case.input)
        end
	#execute the program
        #TODO: set timeout
        if language.execute_command != nil && language.execute_command.length > 0
          output = `#{language.execute_command} #{source_code_file} < #{test_case_file}`
          puts "output = " + output.inspect
        else
          output = `#{solution_file} < #{test_case_file}`
        end
	if  output == test_case.expected_output
          test_case_result.status = TestCaseResultStatus::PASSED
	else
          test_case_result.status = TestCaseResultStatus::FAILED_UNEXPECTED_OUTPUT
        end
        test_case_result.test_case_id = test_case.id
        if test_case_result.save
          puts "saved test result #{test_case_result.id}"
          submission_result.completed = true
          submission_result.save
        else
          puts "save test result failed"
        end
      end
      #run test cases
    else
      #report
      submission_result.details = "Build failed: " + build_output
       submission_result.completed = true
      submission_result.save
      puts "build failed for submission #{submission_id}"
    end
  end
end
