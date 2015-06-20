class EmailsController < ApplicationController

  def new
    @email = Emails.new
    respond_to do |format|
      format.html
    end
  end

  def create
    Pony.mail({
      :to => 'comments-ppsai-initial-05may15@icann.org',
      :cc => 'policy-staff@icann.org',
      :from => 'team@respectourprivacy.com',
      :subject => 'iCANN - Respect Our Privacy',
      :body => params[:body],
      :via => :smtp,
      :via_options => {
        :address        => ENV['SMTP_ADDRESS'],
        :port           => ENV['SMTP_PORT'],
        :user_name      => ENV['SMTP_USER'],
        :password       => ENV['SMTP_PASS'],
        :authentication => :plain,
        :domain         => "respectourprivacy.com"
      }
    })
    redirect_to root_path, notice: "Your email sent successfully."
  end

end