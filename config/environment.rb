<<<<<<< HEAD
# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
BookmarkApplication::Application.initialize!
=======
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
MyProject::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   :tls => true,
   :address => "smtp.gmail.com",
   :port => 587,
   :domain => "gmail.com",
   :authentication => :login,
   :user_name => "[username]",
   :password => "[password]"
 }
>>>>>>> 4a8ce979fa08b275175a00818938acf83923a916
