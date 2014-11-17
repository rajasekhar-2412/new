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
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :username,
            presence: true,
            uniqueness: {case_sensitive: false},
            format: {with: /\w+/}

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :conversations, :foreign_key => :sender_id

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

  def display_name
       "#{self.username}".camelize

  end
end
