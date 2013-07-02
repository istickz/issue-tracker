class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @issue = Issue.new
    @issues_for_user = Issue.where(assigned: "#{@user.id}", solved: true)
  end


  def index
   @profiles = User.all
  end
end
