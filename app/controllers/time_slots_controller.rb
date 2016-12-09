class TimeSlotsController < ApplicationController
  before_filter :check_permission
  before_action :set_time_slot, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @time_slots = TimeSlot.all
    respond_with(@time_slots)
  end

  def show
    respond_with(@time_slot)
  end

  def new
    @time_slot = TimeSlot.new
    respond_with(@time_slot)
  end

  def edit
  end

  def create
    day = ''
    time_slot_params.each do |d|
      d.each do |v|
        day = v if v.is_a?(String)
        unless v.is_a?(String)
          @time_slot = TimeSlot.new(v)
          if @time_slot.day == '1'
            @time_slot.day = day
            @time_slot.save
          end
        end
      end
    end
    respond_with(@time_slot)
  end

  def update
    @time_slot.update(time_slot_params)
    respond_with(@time_slot)
  end

  def destroy
    @time_slot.destroy
    respond_with(@time_slot)
  end

  private
  def set_time_slot
    @time_slot = TimeSlot.find(params[:id])
  end

  def time_slot_params
    # params.require(:time_slot).permit(:day, :start_time, :end_time, :patient_count, :duration)
    params.require(:time_slot).permit!
  end

  def check_permission
    if current_user.type != 'Doctor'
      redirect_to users_dashboard_path, flash: {alert: 'Sorry, you are not a doctor!'}
    end
  end

end
