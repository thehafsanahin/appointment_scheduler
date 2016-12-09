class KnownProblemsController < ApplicationController
  before_action :set_known_problem, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @known_problems = KnownProblem.all
    respond_with(@known_problems)
  end

  def show
    respond_with(@known_problem)
  end

  def new
    @known_problem = KnownProblem.new
    respond_with(@known_problem)
  end

  def edit
  end

  def create
    @known_problem = KnownProblem.new(known_problem_params)
    @known_problem.save
    respond_with(@known_problem)
  end

  def update
    @known_problem.update(known_problem_params)
    respond_with(@known_problem)
  end

  def destroy
    @known_problem.destroy
    redirect_to patients_records_path(id: current_user.id)
  end

  private
    def set_known_problem
      @known_problem = KnownProblem.find(params[:id])
    end

    def known_problem_params
      params[:known_problem].permit!
    end
end
