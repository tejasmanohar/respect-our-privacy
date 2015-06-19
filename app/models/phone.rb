class Phone < ActiveRecord::Base

  validates :number, :email => true, presence: true, :numericality => true, length: { is: 10 }
  validates :requests_count, :numericality => { :less_than_or_equal_to => 5, only_integer: true }, presence: true

  private

  def call
    
  end

end
