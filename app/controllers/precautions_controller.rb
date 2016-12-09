class PrecautionsController < ApplicationController
  before_action :set_precaution, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @precautions = Precaution.all
    respond_with(@precautions)
  end

  def show
    respond_with(@precaution)
  end

  def new
    @precaution = Precaution.new
    respond_with(@precaution)
  end

  def edit
  end

  def create
    @precaution = Precaution.new(precaution_params)
    @precaution.save
    respond_with(@precaution)
  end

  def update
    @precaution.update(precaution_params)
    respond_with(@precaution)
  end

  def destroy
    @precaution.destroy
    respond_with(@precaution)
  end

  private
    def set_precaution
      @precaution = Precaution.find(params[:id])
    end

    def precaution_params
      params.require(:precaution).permit(:name, :details)
    end
end
