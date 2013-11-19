class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
     @submission_result = SubmissionResult.includes(:test_case_results).find_by_submission_id(params[:id])
  end

  # GET /submissions/new
  def new
    @language = Language.all
    problem = Problem.find(params[:problem_id])
    @submission = problem.submissions.build
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submisssions
  # POST /submissions.json
  def create
    problem = Problem.find(params[:problem_id])
    
    @submission = problem.submissions.create(submission_params)
    respond_to do |format|
      if @submission.save
        @submission_result = @submission.build_submission_result
        @submission_result.details = "Creating..." 
        @submission_result.save
        EvaluatorWorker.perform_async(@submission_result.id)
        format.html { redirect_to @submission_result, notice: 'Problem solution try was successfully created.' }
        format.json { render :template => "submission_results/show", status: :created, location: @submission_result }
      else
        format.html { render action: 'new' }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  #TODO: remove submission edit
  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Problem solution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:code, :language_id)
    end
end
