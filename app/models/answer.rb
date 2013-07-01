class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :issue
  attr_accessible :body

  validates :body, presence: true, length: { in: 2..255 }
end
