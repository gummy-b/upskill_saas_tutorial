class ContactMailer < ActionMailer::Base
    default to: 'mcbride.mogale@gmail.com'
    
    def create_mail(name, email, body)
        @name = name
        @email = email 
        @body = body

        mail(from: email, subject: 'Contact Form Message')
    end
    
end