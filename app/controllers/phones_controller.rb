class PhonesController < ApplicationController

  include Webhookable

  after_filter :set_header, :only => :voice

  def new
    @phone = Phone.new
    respond_to do |format|
      format.html
    end
  end

  def create
    number = params[:phone][:number].tr('^0-9', '')
    @phone = Phone.find_by_number(number);

    if @phone.nil?
      @phone = Phone.new(:number => number)
      @phone.save
    else
      @phone.increment(:requests_count)
    end

    @phone.call

    respond_to do |format|
      format.html
    end
  end

  def voice
    message = Twilio::TwiML::Response.new do |m|
      m.Play 'http://linode.rabasa.com/cantina.mp3'
      m.Dial '+13103015800'
    end
    render_twiml message
  end

end