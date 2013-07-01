class AnswersController < ApplicationController
  before_filter  :authenticate_user!, only: [:create]

  def create
    @issue = Issue.find(params[:issue_id])
    @answer = @issue.answers.build(params[:answer])
    @answer.user = current_user
    @issue.solved = true

    if @answer.save
       @issue.save
      flash[:success] = 'Your answer has been posted!'
      redirect_to :back
      # redirect_to @issue
    else
      @issue = Issue.find(params[:issue_id])
      render 'issues/show'
    end

  end

end
