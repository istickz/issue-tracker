class User < ActiveRecord::Base
  has_many :issues
  has_many :answers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :avatar,:current_info
  has_attached_file :avatar, :styles => { :medium => "400x400>", :thumb => "37x37>" }, :default_url => "/images/:style/missing.png"

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false

  def my_issues(params)
    issues.paginate(page: params[:page], order: 'created_at DESC', per_page: 10)
  end


end
