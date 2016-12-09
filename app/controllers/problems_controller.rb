class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @problems = Problem.all
    respond_with(@problems)
  end

  def show
    respond_with(@problem)
  end

  def new
    @problem = Problem.new
    @problem.known_problems.build
    respond_with(@problem)
  end

  def edit
  end

  def create
    @problem = Problem.new(problem_params)
    @problem.known_problems.last.patient = current_user
    if @problem.save
      redirect_to patients_records_path(id: current_user.id), flash: {success: 'Problem successfully added.'}
    end
  end

  def update
    @problem.update(problem_params)
    respond_with(@problem)
  end

  def destroy
    @problem.destroy
    redirect_to patients_records_path(id: current_user.id)
  end

  private
    def set_problem
      @problem = Problem.find(params[:id])
    end

    def problem_params
      # raise params.inspect
      params.require(:problem).permit(:name, :details, :known_problems_attributes => [:details])
    end
end
