class GitHubRanksController < ApplicationController
  def index
    @git_hub_ranks = GitHubRank.all
  end
end
