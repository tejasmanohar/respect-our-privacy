require 'uri'

class EmailsController < ApplicationController

  def new
    @email = Emails.new
    respond_to do |format|
      format.html
    end
  end

  def create
    to_addresses = [
      'comments-ppsai-initial-05may15@icann.org'
    ]

    if (params.has_key?(:email))
      if (params[:email] =~ /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
        cc_addresses = [
          'policy-staff@icann.org',
          params[:email]
        ]
      else
        cc_addresses = [
          'policy-staff@icann.org'
        ]
      end
    else
      cc_addresses = [
        'policy-staff@icann.org'
      ]
    end

    if (params.has_key?(:name))
      subject = 'ICANN - ' << params[:name] << ' Says Respect Our Privacy'
    else
      subject = 'iCANN - Respect Our Privacy'
    end

    #Pony.mail({
    #  :to => to_addresses.join(','),
    #  :cc => cc_addresses.join(','),
    #  :from => 'team@respectourprivacy.com',
    #  :subject => subject,
    #  :body => params[:body],
    #  :via => :smtp,
    #  :via_options => {
    #    :address        => ENV['SMTP_ADDRESS'],
    #    :port           => ENV['SMTP_PORT'],
    #    :user_name      => ENV['SMTP_USER'],
    #    :password       => ENV['SMTP_PASS'],
    #    :authentication => :plain,
    #    :domain         => "respectourprivacy.com"
    #  }
    #})

    mailto = 'mailto:comments-ppsai-initial-05may15@icann.org?cc=policy-staff@icann.org&subject=' << subject << '&body=' << URI.encode(params[:body])

    notice = '<a href="_mailto_">Click here</a> to launch your email client and send your comment to ICANN.<br><br>' <<
      'Wait for a verification link from them and be sure to click it to ensure your comment goes through.<br><br>' <<
      'Alternatively, you can manually send the email to "comments-ppsai-initial-05may15@icann.org” and copy the body of our email by clicking <a href="#" class="copy">here</a>.'

    flash[:mailto] = mailto

    redirect_to root_path, notice: notice
  end

end
