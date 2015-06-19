class UsersController < ApplicationController

  def new_phone
    respond_to do |format|
      format.html
    end
  end

  def new_email
    respond_to do |format|
      format.html
    end
  end

  def create
  end

end