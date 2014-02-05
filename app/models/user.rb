class User < ActiveRecord::Base
  # Include default devise modules. Others available are:

  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bookmarks
  has_many :custom_requirements
  has_many :customs

  attr_accessor :login

  validates :username,
            presence: true,
            uniqueness: {case_sensitive: false},
            format: {with: /\w+/}

  has_many :friendships
  has_many :friends, :through => :friendships

  def to_param
    self.username
  end


  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

end
