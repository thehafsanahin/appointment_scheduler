class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy, :update_status]

  respond_to :html

  def index
    @appointments = current_user.appointments.accepted
    respond_with(@appointments)
  end

  def show
    respond_with(@appointment)
  end

  def new
    @appointment = Appointment.new
    @params = Hash.new
    @params['date'] = Date.parse(params[:date].to_s).strftime('%d, %B %Y')
    @params['start_time'] = Time.at(params[:start_time].to_i)
    @params['doctor_id'] = params[:doctor_id].to_i
    doctor = Doctor.find(params[:doctor_id])
    @params['doctor_name'] = doctor.full_name if doctor

    respond_with(@appointment)
  end

  def edit
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.patient_id = current_user.id
    if @appointment.save
      redirect_to users_dashboard_path flash: {success: 'Appointment Successfully Created!'}
    else
      redirect_to search_index_path flash: {error: 'Sorry, try again!'}
    end
    # respond_with(@appointment)
  end

  def update
    @appointment.update(appointment_params)
    respond_with(@appointment)
  end

  def destroy
    @appointment.destroy
    respond_with(@appointment)
  end

  def update_status
    @appointment.update(status: params[:status])
    redirect_to :back
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:date, :start_time, :end_time, :reason, :doctor_id, :patient_id)
    end
end
