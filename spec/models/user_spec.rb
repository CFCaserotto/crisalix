require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      user = User.new(email: "charlie@example.com", password: "password123")
      expect(user).to be_valid
    end

    it "is not valid without an email" do
      user = User.new(password: "password123")
      expect(user).not_to be_valid
    end

    it "is not valid without a password" do
      user = User.new(email: "test@example.com")
      expect(user).not_to be_valid
    end
  end

  describe "associations" do
    it { should have_many(:appointments_as_patient).with_foreign_key('patient_id').dependent(:destroy) }
    it { should have_many(:appointments_as_doctor).with_foreign_key('doctor_id').dependent(:destroy) }
    it { should have_one_attached(:avatar) }
  end

  describe "roles" do
    it "defaults to 'user' role" do
      user = User.new(email: "test@example.com", password: "password123")
      expect(user.role).to eq('patient')
    end

    it "can be assigned a different role" do
      user = User.new(email: "admin@example.com", password: "password123", role: "doctor")
      expect(user).to be_valid
      expect(user.role).to eq('doctor')
    end
  end
end