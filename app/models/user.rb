class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_initialize :set_default_status, if: :new_record?

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  private

  # if the user is created, the username is set to the email before the @
  def set_default_status
    self.username = self.email.split('@')[0]
  end
end
