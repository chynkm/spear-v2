require 'mail'
options = { :address              => 'smtp.gmail.com',
            :port                 => 587,
            :domain               => 'your.host.name',
            :user_name            => '<username>',
            :password             => '<password>',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

Mail.defaults do
  delivery_method :smtp, options
end

# Mail.deliver do
#        to 'chynkm@gmail.com'
#      from 'no-reply@spear.com'
#   subject 'testing sendmail'
#      body 'testing sendmail'
# end
# (or)
# mail = Mail.new do
#        to 'chynkm@gmail.com'
#      from 'no-reply@spear.com'
#   subject 'testing sendmail'
#      body 'testing sendmail'
# end
#
# mail.deliver