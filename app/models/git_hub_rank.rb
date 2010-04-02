class GitHubRank < ActiveRecord::Base
  belongs_to :language
  
  default_scope :order => "date ASC"
end
