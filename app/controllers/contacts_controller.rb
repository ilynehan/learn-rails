class ContactsController < ApplicationController

  # instantiate empty Contact model: @contact
  # render the app/views/contacts/new.html.erb view
  def new
    @contact = Contact.new
  end

  # SimpleForm will: set a destination URL that corresponds to the ContactsController#create action
  # create method will instatiate a new Contact model using the data from the form
  def create
    @contact = Contact.new(secure_params)
    if @contact.valid?  
        # valid? [ActiveModel] checks of the validation requirements we've set in the model

          # TODO save data

          # TODO send message

          # no need to use params hash; can access as @contact.name directly from model
      flash[:notice] = "Message sent from #{@contact.name}."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def secure_params
    params.require(:contact).permit(:name, :email, :content)
  end

end


# the "old school" way

=begin
  # create a process_form [MODULE] to respond when the form is submitted
  def process_form 
    
    # params - a hash nested in another hash
    
    # params = {controller: 'contacts',     # current controller
    #           action: 'process_form',     # current action
    #           contacts: {name: 'Daniel',  
    #                      email: 'daniel@danielkehoe.com', 
    #                      content: 'hi!' } # form data
    # }

    # use logger.debug to reveal form data in console log
    Rails.logger.debug "DEBUG: params are #{params}"

    # extract data posted to name field to construct a flash message
    # double quotes and string interpolation
    # #{...} syntax that evaulates Ruby expression and combines with string
    flash[:notice] = "Received request from #{params[:contact][:name]}"

    # then redirect to home page
    redirect_to root_path
  end

end
=end
