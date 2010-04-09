class Language < ActiveRecord::Base
  has_many :git_hub_ranks
  has_many :stack_overflow_questions
  
  def self.interesting
    # all
    [Language.find_by_name("Clojure"), Language.find_by_name("Erlang"), Language.find_by_name("Haskell"), Language.find_by_name("Scala")]
  end
  
end
