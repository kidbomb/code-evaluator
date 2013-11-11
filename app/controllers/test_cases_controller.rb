class TestCasesController < ApplicationController
  before_action :set_test_case, only: [:show, :edit, :update, :destroy]

  # GET /test_cases
  # GET /test_cases.json
  def index
    @problem = Problem.find(params[:problem_id])
    @test_cases = @problem.test_cases.all
  end

  # GET /test_cases/1
  # GET /test_cases/1.json
  def show
    @test_case = TestCase.find(params[:id])
  end

  # GET /test_cases/new
  def new
    problem = Problem.find(params[:problem_id])
    @test_case = problem.test_cases.build
  end

  # GET /test_cases/1/edit
  def edit
  end

  # POST /test_cases
  # POST /test_cases.json
  def create
    problem = Problem.find(params[:problem_id])
    @test_case = problem.test_cases.create(test_case_params)
    respond_to do |format|
      if @test_case.save
        format.html { redirect_to problem_test_cases_path(@test_case.problem), notice: 'Test case was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_case }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_cases/1
  # PATCH/PUT /test_cases/1.json
  def update
    respond_to do |format|
      if @test_case.update(test_case_params)
        format.html { redirect_to @test_case, notice: 'Test case was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_cases/1
  # DELETE /test_cases/1.json
  def destroy
    @test_case.destroy
    respond_to do |format|
      format.html { redirect_to test_cases_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_case
      @test_case = TestCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_case_params
      params.require(:test_case).permit(:input, :expected_output, :problem_id)
    end
end
