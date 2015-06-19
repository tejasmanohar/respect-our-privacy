class Email < ActiveRecord::Base

  validates :email, :uniqueness => true, :email => true, :presence => true
  validates :requests_count, :numericality => { :less_than_or_equal_to => 5, only_integer: true }, presence: true

end
