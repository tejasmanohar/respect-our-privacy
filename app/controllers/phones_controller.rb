class PhonesController < ApplicationController

  def new
    @phone = Phone.new
    respond_to do |format|
      format.html
    end
  end

  def create

  end

end