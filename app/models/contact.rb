class Contact
  
  # mix in behavior from the ActiveModel class
  include ActiveModel::Model


  # creates attributes (data fields), specifying that each attribute is a string
  attr_accessor :name, :string
  attr_accessor :email, :string
  attr_accessor :content, :string

  # using ActiveModel validation methods:
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :content
  
  # provided a complex regex to test if valid email address
  validates_format_of :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates_length_of :content, :maximum => 500

  end