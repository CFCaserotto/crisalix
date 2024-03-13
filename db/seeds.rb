# db/seeds.rb
require 'open-uri'

# Clear existing data
User.destroy_all
Appointment.destroy_all

User.create(name: "Gemma", email: "gemma@example.com", password: "password", role: "patient", city: "Madrid")
User.create(name: "Dr.Gemma", email: "gemmadr@example.com", password: "password", role: "doctor", city: "Barcelona")
# Create patients
5.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
    role: "patient",
    city: Faker::Address.city
  )
end

# Create doctors
5.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
    role: "doctor",
    city: Faker::Address.city
  )
end



# Create appointments
patients = User.where(role: "patient")
doctors = User.where(role: "doctor")

10.times do
  patient = patients.sample
  doctor = doctors.sample
  appointment_date = Faker::Date.between(from: Date.today, to: 30.days.from_now)
  appointment_time = Faker::Time.between(from: DateTime.now, to: DateTime.now + 30, format: :short)
  appointment = Appointment.new(
    patient: patient,
    doctor: doctor,
    date: appointment_date,
    time: appointment_time
  )

  # Download and attach photos
  3.times do |i|
    photo_url = "https://thispersondoesnotexist.com/"
    tempfile = Down.download(photo_url)
    appointment.send("photo#{i + 1}").attach(io: File.open(tempfile.path), filename: "image#{i + 1}.jpg", content_type: "image/jpeg")
  end

  appointment.save!
end
