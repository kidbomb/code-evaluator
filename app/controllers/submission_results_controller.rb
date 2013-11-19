class SubmissionResultsController < ApplicationController
  before_action :set_submission_result, only: [:show, :edit, :update, :destroy]

  # GET /submission_results
  # GET /submission_results.json
  def index
    @submission_results = SubmissionResult.all
  end

  # GET /submission_results/1
  # GET /submission_results/1.json
  def show
    @submission_result = SubmissionResult.includes(:test_case_results).find(params[:id])
  end

  # GET /submission_results/new
  def new
    @submission_result = SubmissionResult.new
  end

  # GET /submission_results/1/edit
  def edit
  end

  # POST /submission_results
  # POST /submission_results.json
  def create
    @submission_result = SubmissionResult.new(submission_result_params)

    respond_to do |format|
      if @submission_result.save
        format.html { redirect_to @submission_result, notice: 'Submission result was successfully created.' }
        format.json { render action: 'show', status: :created, location: @submission_result }
      else
        format.html { render action: 'new' }
        format.json { render json: @submission_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submission_results/1
  # PATCH/PUT /submission_results/1.json
  def update
    respond_to do |format|
      if @submission_result.update(submission_result_params)
        format.html { redirect_to @submission_result, notice: 'Submission result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @submission_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submission_results/1
  # DELETE /submission_results/1.json
  def destroy
    @submission_result.destroy
    respond_to do |format|
      format.html { redirect_to submission_results_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission_result
      @submission_result = SubmissionResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_result_params
      params[:submission_result]
    end
end
