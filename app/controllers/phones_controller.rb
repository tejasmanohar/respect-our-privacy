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

    begin
      @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      @call = @client.calls.create(
        from: ENV['TWILIO_NUMBER'],
        to: number,
        url: "#{ENV['DOMAIN']}/phones/voice"
      )

    rescue
      return redirect_to root_path, notice: 'phone_error'
    end

    redirect_to root_path(next: "email"), notice: 'phone'
  end

  def voice
    message = Twilio::TwiML::Response.new do |m|
      m.Play ENV['DOMAIN']+'message.mp3'
      m.Dial '+13103015800'
    end
    render_twiml message
  end

end
