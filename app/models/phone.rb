class Phone < ActiveRecord::Base

  validates :number, :email => true, presence: true, :numericality => true, length: { is: 10 }
  validates :requests_count, :numericality => { :less_than_or_equal_to => 5, only_integer: true }, presence: true

  def call
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    @call = @client.calls.create(
      from: ENV['TWILIO_NUMBER'],
      to: self.number,
      url: "#{ENV['domain']}/phones/voice"
    )
  end

end
