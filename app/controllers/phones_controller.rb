class PhonesController < ApplicationController

  def new
    @phone = Phone.new
    respond_to do |format|
      format.html
    end
  end

  def create
    number = params[:user][:number].tr('^0-9', '')
    @user = User.find_by_phone_number(number);

    if @user.nil?
      @user = User.new(:number => number)
      @user.save
    else
      @user.increment(:requests_count)
    end
  end

end