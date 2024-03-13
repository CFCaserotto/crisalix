class Appointment < ApplicationRecord
    belongs_to :patient, class_name: 'User'
    belongs_to :doctor, class_name: 'User'
    
    validates :date, :time, :doctor_id, :photo1, :photo2, :photo3, presence: true
    #has_many_attached :photos
    has_one_attached :photo1
    has_one_attached :photo2
    has_one_attached :photo3

    validate :validate_photos_size
    validate :validate_photo_content_type

    private

    def validate_photos_size
      [photo1, photo2, photo3].each do |photo|
        next unless photo.attached?
    
        if photo.blob.byte_size > 5.megabytes  # Adjust the size limit as needed
          photo.purge  # Remove the attached photo
          errors.add(:photos, "should be less than 5MB")
        end
      end
    end

    def validate_photo_content_type
      [photo1, photo2, photo3].each do |photo|
        next unless photo.attached?
    
        unless photo.content_type.in?(%w[image/jpeg image/png image/gif])
          photo.purge
          errors.add(:photos, "must be a JPEG, PNG, or GIF")
        end
      end
    end
end
