# encoding: utf-8

class IssuesController < ApplicationController
  before_filter  :authenticate_user!, only: [:create, :edit, :update, :your_issues]

  def create
    @issue = current_user.issues.build(params[:issue])
    if @issue.save
      flash[:success] = 'Ваш вопрос отправлен' #Нужно доработать отображение успешного сообщения
      redirect_to :back
    else
      @issues =  Issue.unsolved(params)
      render 'index'
    end
  end

  def index
    @issue = Issue.new
    @issues =  Issue.unsolved(params)
    @usernames = []
    User.all.each do |inf|
      @usernames << inf[:name]
    end
  end

  def show
    @issue = Issue.find(params[:id])
    @answer = Answer.new
  end

  def my_issues
    @issues = current_user.my_issues(params)
  end

  def issues_for_me
    @issues = Issue.where(solved: false, assigned: "#{current_user.id}")
  end

end
