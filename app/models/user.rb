class User < ActiveRecord::Base
  validates :phone_number, :uniqueness => true, :numericality => true, length: { is: 10 }
  validates :requests, :numericality => { :less_than_or_equal_to => 5 }
end
