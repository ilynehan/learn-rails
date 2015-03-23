Rails.application.routes.draw do

  # routing the "Rail's" way


  resources :contacts, only: [:new, :create]
  # want only two routes 
  # new route has properties : 
    # new_contact_path - route helper
    # contacts - name of the controller (ContactsController)
    # new - controller action
    # localhost:3000/contacts/new - URL
    # GET - HTTP method to display a page
  # controller has properties:
    # same as new but instead of GET :
    # POST - HTTP method to submit form data
  # RAKE ROUTE to see if we've created the routes we need

  # contacts - name of the controller
  # process_form - a controller action

  # create route helper that generates a URL and ands off the request to a controller
  # post 'contact', to: 'contacts#process_form'
  root to: 'visitors#new'
end
