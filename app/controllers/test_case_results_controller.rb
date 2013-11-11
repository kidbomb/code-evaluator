class TestCaseResultsController < ApplicationController
  before_action :set_test_case_result, only: [:show, :edit, :update, :destroy]

  # GET /test_case_results
  # GET /test_case_results.json
  def index
    submission = Submission.find(params[:submission_id])
    @test_case_results = submission.test_case_results
  end

  # GET /test_case_results/1
  # GET /test_case_results/1.json
  def show
  end

  # GET /test_case_results/new
  def new
    @test_case_result = TestCaseResult.new
  end

  # GET /test_case_results/1/edit
  def edit
  end

  # POST /test_case_results
  # POST /test_case_results.json
  def create
    @test_case_result = TestCaseResult.new(test_case_result_params)

    respond_to do |format|
      if @test_case_result.save
        format.html { redirect_to @test_case_result, notice: 'Test case result was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_case_result }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_case_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_case_results/1
  # PATCH/PUT /test_case_results/1.json
  def update
    respond_to do |format|
      if @test_case_result.update(test_case_result_params)
        format.html { redirect_to @test_case_result, notice: 'Test case result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_case_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_case_results/1
  # DELETE /test_case_results/1.json
  def destroy
    @test_case_result.destroy
    respond_to do |format|
      format.html { redirect_to test_case_results_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_case_result
      @test_case_result = TestCaseResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_case_result_params
      params.require(:test_case_result).permit(:status, :submission_id, :test_case_id)
    end
end
