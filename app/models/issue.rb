class Issue < ActiveRecord::Base
  belongs_to :user
  has_many :answers


  attr_accessible :body, :solved, :assigned

  validates :body, presence: true, length: { in: 10..255}
  validates :solved, inclusion: { in: [true, false]}

  def self.solved(params)
    where(solved: true).paginate(page: params[:page], order: 'created_at DESC', per_page: 10)
  end

  def self.unsolved(params)
    where(solved: false).paginate(page: params[:page], order: 'created_at DESC', per_page: 10)
  end









  def self.search(params)
    where("body LIKE ?", "%#{params[:keyword]}%").paginate(page: params[:page], order: 'created_at DESC', per_page: 10)
  end


end
