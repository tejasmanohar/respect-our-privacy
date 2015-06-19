class Email < ActiveRecord::Base

  validates :email, :uniqueness => true, :email => true, :presence => true
  validates :requests_count, :numericality => { :greater_than => 0, :less_than_or_equal_to => 5, only_integer: true }, presence: true

end
