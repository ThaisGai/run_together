class LeaderboardController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def index
    @users = User.where.not(name: [nil, '']).sort_by { |u| -u.points }.first(20)
  end
end
