desc "Set ENV"
task :set_env do
  require 'securerandom'
  ENV["SECRET_KEY_BASE"] = SecureRandom.hex(64)
end