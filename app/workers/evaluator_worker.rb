class EvaluatorWorker
  include Sidekiq::Worker

  def perform(submission_id)
    submission = Submission.find(submission_id)
    tmp_dir = "/tmp/submission" + submission.id.to_s
    system("mkdir " + tmp_dir)
    source_code_file = tmp_dir + "/code.c"
    solution_file = tmp_dir + "/solution"
    File.open(source_code_file, "w+") do |f|
      f.write(submission.code)
    end

    
    #TODO: swith for each language (create build_command/interpret_command/extension for language)
    #TODO: determine how to report build error
    build_ok = system("gcc -o " + solution_file + " " + source_code_file)
    if build_ok

      test_cases = TestCase.find_all_by_problem_id(submission.problem_id)
      test_cases.each do |test_case|
        test_case_result = submission.test_case_results.new
        test_case_file = tmp_dir + "/test_case" +test_case.id.to_s
        
        File.open(test_case_file, "w+") do |f|
          f.write(test_case.input)
        end
	#execute the program
        #TODO: set timeout
        output = `#{solution_file} < #{test_case_file}`
	if  output == test_case.expected_output
          test_case_result.status = TestCaseResultStatus::PASSED
	else
          test_case_result.status = TestCaseResultStatus::FAILED_UNEXPECTED_OUTPUT
        end
        test_case_result.test_case_id = test_case.id
        if test_case_result.save
          puts "saved test result #{test_case_result.id}"
        else
          puts "save test result failed"
        end
      end
      #run test cases
    else
      puts "build failed for submission #{submission_id}"
    end
  end
end
