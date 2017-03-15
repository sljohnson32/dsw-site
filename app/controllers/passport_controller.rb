require './app/lib/passport'

class PassportController < ApplicationController

  respond_to :html
  
  def login
    passport_auth = Inversoft::Auth.new
    passport_auth.login
  end
  
  def register
    passport_auth = Inversoft::Auth.new
    passport_auth.register
  end
  
end
