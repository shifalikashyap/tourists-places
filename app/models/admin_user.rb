class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
  :registerable,
  :recoverable,
  :rememberable, 
  :validatable, 
  :confirmable,
  :trackable,
  authentication_keys: [:login]

  validates :email, :contact_number, presence: true

  validates :password, presence: true, length: { minimum: 8 }

  attr_writer :login

  def login
    @login || contact_number || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(contact_number) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:contact_number) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end


  private 

  def after_confirmation
    WelcomeMailer.send_greetings_notification(self)
    .deliver_now
  end

end
