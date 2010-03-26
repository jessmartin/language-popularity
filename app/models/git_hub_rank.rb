class GitHubRank < ActiveRecord::Base
  belongs_to :language
  
  default_scope :order => "rank ASC"
end
