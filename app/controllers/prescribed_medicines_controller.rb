class PrescribedMedicinesController < ApplicationController
  before_action :set_prescribed_medicine, only: [:show, :edit, :update, :destroy]

  # GET /prescribed_medicines
  # GET /prescribed_medicines.json
  def index
    @prescribed_medicines = PrescribedMedicine.all
  end

  # GET /prescribed_medicines/1
  # GET /prescribed_medicines/1.json
  def show
  end

  # GET /prescribed_medicines/new
  def new
    @prescribed_medicine = PrescribedMedicine.new
  end

  # GET /prescribed_medicines/1/edit
  def edit
  end

  # POST /prescribed_medicines
  # POST /prescribed_medicines.json
  def create
    @prescribed_medicine = PrescribedMedicine.new(prescribed_medicine_params)

    respond_to do |format|
      if @prescribed_medicine.save
        format.html { redirect_to @prescribed_medicine, notice: 'Prescribed medicine was successfully created.' }
        format.json { render :show, status: :created, location: @prescribed_medicine }
      else
        format.html { render :new }
        format.json { render json: @prescribed_medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prescribed_medicines/1
  # PATCH/PUT /prescribed_medicines/1.json
  def update
    respond_to do |format|
      if @prescribed_medicine.update(prescribed_medicine_params)
        format.html { redirect_to @prescribed_medicine, notice: 'Prescribed medicine was successfully updated.' }
        format.json { render :show, status: :ok, location: @prescribed_medicine }
      else
        format.html { render :edit }
        format.json { render json: @prescribed_medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescribed_medicines/1
  # DELETE /prescribed_medicines/1.json
  def destroy
    @prescribed_medicine.destroy
    respond_to do |format|
      format.html { redirect_to prescribed_medicines_url, notice: 'Prescribed medicine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescribed_medicine
      @prescribed_medicine = PrescribedMedicine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prescribed_medicine_params
      params.require(:prescribed_medicine).permit(:name, :strength, :dosage, :duration, :note, :prescription_id)
    end
end
