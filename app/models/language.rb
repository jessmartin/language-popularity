class Language < ActiveRecord::Base
  has_many :git_hub_ranks
  has_many :stack_overflow_questions
end
