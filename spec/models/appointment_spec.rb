require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe "associations" do
    it { should belong_to(:patient).class_name('User') }
    it { should belong_to(:doctor).class_name('User') }
  end
  
  describe "validations" do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:doctor_id) }
    it { should validate_presence_of(:photo1) }
    it { should validate_presence_of(:photo2) }
    it { should validate_presence_of(:photo3) }
  end  

  describe "creating appointments" do
    let(:patient_user) { FactoryBot.create(:user, :patient) }
    let(:doctor_user) { FactoryBot.create(:user, :doctor) }
    
    it "creates an appointment for a patient" do
      photo_url = "https://thispersondoesnotexist.com/"
      tempfile = Down.download(photo_url)
      appointment = Appointment.new(date: Date.today, time: Time.now, doctor_id: doctor_user.id, patient_id: patient_user.id)
      appointment.photo1.attach(io: File.open(tempfile.path), filename: 'test_photo.jpg')
      appointment.photo2.attach(io: File.open(tempfile.path), filename: 'test_photo.jpg')
      appointment.photo3.attach(io: File.open(tempfile.path), filename: 'test_photo.jpg')
    
      expect(appointment).to be_valid
    end

    it "purges photos with invalid content type" do
      photo_url = "https://thispersondoesnotexist.com/"
      tempfile = Down.download(photo_url)
      appointment = Appointment.new(date: Date.today, time: Time.now, doctor_id: doctor_user.id, patient_id: patient_user.id)
      invalid_photo = fixture_file_upload('spec/fixtures/files/test.txt', 'text/plain')
      appointment.photo1.attach(invalid_photo)
      appointment.photo2.attach(io: File.open(tempfile.path), filename: 'test_photo.jpg')
      appointment.photo3.attach(io: File.open(tempfile.path), filename: 'test_photo.jpg')
      
      expect(appointment).not_to be_valid
      expect(appointment.errors[:photos]).to include("must be a JPEG, PNG, or GIF")
    end

  end 
end