class User < ActiveRecord::Base
  attr_accessible :email, :status
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with:/\A[A-Za-z0-9._%+]+@[A-Za-z0-9.-]+.[A-Za-z]+\z/i,
    message: "email not valid" }
end
