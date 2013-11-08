class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :edit, :update, :destroy]

  # GET /problems
  # GET /problems.json
  def index
    challenge = Challenge.find(params[:challenge_id])
    @problems = challenge.problems
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
    challenge = Challenge.find(params[:challenge_id])
    @problem = challenge.problems.find(params[:id])
  end

  # GET /problems/new
  def new
    challenge = Challenge.find(params[:challenge_id])
    @problem = challenge.problems.build
  end

  # GET /problems/1/edit
  def edit
  end

  # POST /problems
  # POST /problems.json
  def create
    challenge = Challenge.find(params[:challenge_id])
    @problem = challenge.problems.create(problem_params)

    respond_to do |format|
      if @problem.save
        format.html { redirect_to challenge_problems_path(@problem.challenge), notice: 'Problem was successfully created.' }
        format.json { render action: 'show', status: :created, location: @problem }
      else
        format.html { render action: 'new' }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /problems/1
  # PATCH/PUT /problems/1.json
  def update
    respond_to do |format|
      if @problem.update(problem_params)
        format.html { redirect_to challenge_problem_path(@problem, @problem.challenge), notice: 'Problem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem.destroy
    respond_to do |format|
      format.html { redirect_to problems_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem
      @problem = Problem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def problem_params
	params.require(:problem).permit(:name, :description, :challenge_id)
    end
end
