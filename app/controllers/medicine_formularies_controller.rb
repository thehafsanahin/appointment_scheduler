class MedicineFormulariesController < ApplicationController
  before_action :set_medicine_formulary, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @medicine_formularies = MedicineFormulary.all
    respond_with(@medicine_formularies)
  end

  def show
    respond_with(@medicine_formulary)
  end

  def new
    @medicine_formulary = MedicineFormulary.new
    respond_with(@medicine_formulary)
  end

  def edit
  end

  def create
    @medicine_formulary = MedicineFormulary.new(medicine_formulary_params)
    @medicine_formulary.save
    respond_with(@medicine_formulary)
  end

  def update
    @medicine_formulary.update(medicine_formulary_params)
    respond_with(@medicine_formulary)
  end

  def destroy
    @medicine_formulary.destroy
    respond_with(@medicine_formulary)
  end

  private
    def set_medicine_formulary
      @medicine_formulary = MedicineFormulary.find(params[:id])
    end

    def medicine_formulary_params
      params.require(:medicine_formulary).permit(:name, :brand_name, :price, :uses)
    end
end
