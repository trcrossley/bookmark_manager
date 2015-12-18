require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_hash, Text

  def password=(password)
    self.password_hash = BCrypt::Password.create(password)
  end


  # include BCrypt
  #
  # def password
  #   @pasword ||= Password.new(password_hash)
  # end
  #
  #
  #
  # def current_user
  #   @current_user ||= User.find(session[:user_id])
  # end

end
