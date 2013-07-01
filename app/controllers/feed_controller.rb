class FeedController < ApplicationController
  def index
    @issues = Issue.all
  end

  def my
    @my_solved_issues = current_user.my_issues(params).solved(params)
  end
end
