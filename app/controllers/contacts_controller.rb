class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(contact_param)
        if @contact.save
            name = params[:contact][:name]
            emial = params[:contact][:email]
            body = params[:contact][:comment]
            ContactMailer.contact_email(name, email, body).deliver
            flash[:success] = "Message Sent."
            redirect_to new_contact_path
        else
            flash[:danger] = @contact.errors.full_messages.join(", ")
            redirect_to new_contact_path
        end    
    end

    private
        def contact_param
            params.require(:contact).permit(:name, :email, :comment)
        end
        
    
    
end