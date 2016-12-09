class PrescriptionsController < ApplicationController
  before_action :set_prescription, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @prescriptions = Prescription.all
    respond_with(@prescriptions)
  end

  def show
    respond_with(@prescription)
  end

  def new
    @appointment = Appointment.find(params[:appointment_id])

    @prescription = Prescription.new
    respond_with(@prescription)
  end

  def edit
  end

  def create
    @prescription = Prescription.new(prescription_params)
    @prescription.save
    respond_with(@prescription)
  end

  def update
    @prescription.update(prescription_params)
    respond_with(@prescription)
  end

  def destroy
    @prescription.destroy
    respond_with(@prescription)
  end

  private
    def set_prescription
      @prescription = Prescription.find(params[:id])
    end

    def prescription_params
      # params[:prescription]
      # params.require(:prescription).permit(:date, :start_time, :end_time, :reason, :doctor_id, :patient_id)
      params.require(:prescription).permit!
    end
end
