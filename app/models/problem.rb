class Problem < ActiveRecord::Base
  has_many :known_problems, dependent: :destroy
  has_many :patients, through: :known_problems

  accepts_nested_attributes_for :known_problems
end
