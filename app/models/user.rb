class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
<<<<<<< HEAD
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bookmarks
=======
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  # after_create :send_welcome_mail
#   
# 
    # def send_welcome_email
      # UserMailer.welcome_email(self).deliver
    # end 

def confirmation_required?
  false
end

>>>>>>> 4a8ce979fa08b275175a00818938acf83923a916
end
