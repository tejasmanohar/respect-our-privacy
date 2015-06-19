class EmailsController < ApplicationController

  def new
    @email = Emails.new
    respond_to do |format|
      format.html
    end
  end

end