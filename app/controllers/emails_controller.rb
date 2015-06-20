class EmailsController < ApplicationController

  def new
    @email = Emails.new
    respond_to do |format|
      format.html
    end
  end

  def create
    Pony.mail({
#      :to => 'comments-ppsai-initial-05may15@icann.org',
#      :cc => 'policy-staff@icann.org',
      :to => 'me@tejas.io',
      :from => 'team@respectourprivacy.com',
      :subject => 'iCANN - Respect Our Privacy',
      :body => "Dear ICANN –\nRegarding the proposed rules governing companies that provide WHOIS privacy services (as set forth in the Privacy & Policy Services Accreditation Issues Policy document):\nI urge you to respect internet users’ rights to privacy and due process.\n-Everyone deserves the right to privacy.\n-No one’s personal information should be revealed without a court order, regardless of whether the request comes from a private individual or law enforcement agency.\nPrivate information should be kept private. Thank you.\n-- #{params[:name]}",
      :via => :smtp,
      :via_options => {
        :address        => 'smtp.sendgrid.net',
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