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

    @prescription = @appointment.build_prescription
    @prescription.problems.build
    @prescription.prescribed_medicines.build
    @prescription.medical_tests.build

    respond_with(@prescription)
  end

  def edit
  end

  def create
    @prescription = Prescription.new(prescription_params)
    @prescription.save
    @prescription.appointment.completed!
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
    params.require(:prescription).permit(:current_weight,
                                         :appointment_id,
                                         problems_attributes: [
                                             :_destroy,
                                             :id,
                                             :name,
                                             :details
                                         ],
                                         prescribed_medicines_attributes: [
                                             :_destroy,
                                             :id,
                                             :name,
                                             :strength,
                                             :dosage,
                                             :duration,
                                             :note
                                         ],
                                         medical_tests_attributes: [
                                             :_destroy,
                                             :id,
                                             :name
                                         ])
  end
end
