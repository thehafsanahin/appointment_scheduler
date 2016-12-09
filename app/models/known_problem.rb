class KnownProblem < ActiveRecord::Base

  belongs_to :problem
  belongs_to :patient

  accepts_nested_attributes_for :problem,
                                reject_if: :all_blank
end
