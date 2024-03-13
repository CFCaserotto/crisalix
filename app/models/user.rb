class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable,
         omniauth_providers: [:facebook, :google_oauth2, :github]

  has_one_attached :avatar
  has_many :articles, dependent: :destroy

  has_many :appointments_as_patient, class_name: 'Appointment', foreign_key: 'patient_id', dependent: :destroy
  has_many :appointments_as_doctor, class_name: 'Appointment', foreign_key: 'doctor_id', dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["city", "name"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["appointments_as_doctor", "appointments_as_patient", "articles", "avatar_attachment", "avatar_blob"]
  end
  def doctor?
    role == 'doctor'
  end

  def name
    @name ||= self[:name].presence || email.split("@").first
  end

  def self.from_omniauth(auth)
    data = auth.info

    User.where(email: data['email']).first_or_create do |user|
      user.name = data['name']
      user.password = Devise.friendly_token[0,20] if user.new_record?
    end
  end

  protected

  def password_required?
    new_record? || password.present?
  end
end
