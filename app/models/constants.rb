class Constants
  DAYS_MAP = %w(Saturday Sunday Monday Tuesday Wednesday Thursday Friday)
  HOURS_MAP = (1..24).map { |n| [format('%02d', n), format('%02d', n)] }
  MINUTES_MAP = (0..60).select { |i| i if i % 15 == 0 || i == 0 }.map { |n| [format('%02d', n), format('%02d', n)] }
end