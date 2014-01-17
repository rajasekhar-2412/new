module ApplicationHelper
<<<<<<< HEAD
=======
  def mark_required(object, attribute)  
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator  
  end  
>>>>>>> 4a8ce979fa08b275175a00818938acf83923a916
end
