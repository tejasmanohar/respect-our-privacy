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

    redirect_to root_path(next: "email"), notice: "We’ll call you shortly and connect you with the ICANN office. Please also submit an email comment to ICANN using the form below. Doing both of these things will ensure your voice is heard! If for some reason, your call wasn’t connected, you can call ICANN’s LA office directly here:  +1 310 301 5800."
  end

  def voice
    message = Twilio::TwiML::Response.new do |m|
      m.Play ENV['DOMAIN']+'/message.mp3'
      m.Dial '+13103015800'
    end
    render_twiml message
  end

end