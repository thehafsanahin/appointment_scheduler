class Doctor < User

  searchkick autocomplete: ['first_name', 'last_name']

  has_one :doctor_profile, dependent: :destroy
  has_many :time_slots, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  accepts_nested_attributes_for :doctor_profile

  def profile
    self.doctor_profile
  end

  def with_doctor_profile
    build_doctor_profile if doctor_profile.nil?
    self
  end

  def available_dates(n=7)
    available_dates = []
    days_map = time_slots.map { |time_slot| time_slot.day }

    today = Date.today

    (1..365).each do
      today = today.next_day
      day = today.strftime('%A')
      available_dates << today if days_map.include? day
      break if available_dates.count >= n
    end
    available_dates
  end

  def available_times_for_dates(n=7)
    available_dates = available_dates(n)
    available_times_for_dates = {}

    available_dates.each do |date|
      time_slot = time_slots.find_by(day: date.strftime('%A'))
      int_date = int_date(date)

      duration = time_slot.duration
      mini_time_slots = mini_time_slots(time_slot.start_time.to_i, time_slot.end_time.to_i, duration)
      # raise "#{time_slot.start_time.to_i} - #{time_slot.duration} - #{time_slot.end_time.to_i}"
      # raise mini_time_slots.inspect
      available_times_for_dates[int_date] = concat_date_with_slots(int_date, mini_time_slots)
    end

    available_times_for_dates
  end

  def int_date(date)
    date.to_s(:number).to_i
  end

  def booked_time_slots
    appointments.map{ |appointment| "#{int_date(appointment.date)}_#{appointment.start_time.to_i}" }
  end

  def concat_date_with_slots(date, slots)
    concated = []
    slots.each do |slot|
      concated << "#{date}_#{slot}"
    end
    concated
  end

  def mini_time_slots(start_time, end_time, duration)
    mini_slots = []
    loop do
      # raise "#{start_time} - #{duration} - #{end_time}"
      break if start_time > end_time
      mini_slots << start_time
      start_time += duration
    end
    mini_slots
  end
end