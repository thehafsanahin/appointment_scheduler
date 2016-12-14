class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def dashboard
    @patient = current_user
    @appointments = current_user.appointments.upcoming
  end

  def index
    @patient = current_user
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def edit
  end

  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def records
    set_patient
    @known_problems = @patient.known_problems
  end

  def public_profile
    set_patient
    @known_problems = @patient.known_problems
  end

  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params[:patient]
    end
end
