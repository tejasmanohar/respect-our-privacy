class PhonesController < ApplicationController

  include Webhookable

  after_filter :set_header, :only => :voice

  def new
    respond_to do |format|
      format.html
    end
  end

  def create
    number = params[:number].tr('^0-9', '')

    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    @call = @client.calls.create(
      from: ENV['TWILIO_NUMBER'],
      to: number,
      url: "#{ENV['DOMAIN']}/phones/voice"
    )

    redirect_to root_path(next: "email"), notice: "We'll call you shortly. We highly recommend sending your comments via the email form below as well."
  end

  def voice
    message = Twilio::TwiML::Response.new do |m|
      m.Play ENV['DOMAIN']+'/message.mp3'
      m.Dial '+13103015800'
    end
    render_twiml message
  end

end