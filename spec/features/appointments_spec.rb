require 'rails_helper'

RSpec.feature "Appointments", type: :feature do
  let(:user) { FactoryBot.create(:user, role: 'patient') }
  let!(:doctor) { FactoryBot.create(:user, role: 'doctor') }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

  scenario "User creates a new appointment" do
    visit new_appointment_path

    #puts page.html
    select_doctor = find('#appointment_doctor_id', wait: 2)
    select_doctor.select(doctor.name)

    fill_in "Date", with: "2024-03-12"
    fill_in "Time", with: "10:00 AM"
    
    find(:xpath, "//input[@id='patient']", visible: false).set(user.id)
        
    attach_file("photo1_input", Rails.root + "spec/fixtures/files/photo.jpg")
    attach_file("photo2_input", Rails.root + "spec/fixtures/files/photo.jpg")
    attach_file("photo3_input", Rails.root + "spec/fixtures/files/photo.jpg")
    click_button "Submit"

    expect(page).to have_content("Appointment was successfully created.")
  end

  scenario "User updates an appointment" do
    appointment = create(:appointment)
    visit edit_appointment_path(appointment)

    fill_in "Date", with: "2024-03-13"
    click_button "Submit"

    expect(page).to have_content("Appointment was successfully updated.")
    expect(page).to have_content("2024-03-13")
  end

  scenario "User deletes an appointment" do
    appointment = create(:appointment, patient: user)

    visit appointments_path

    expect {
      click_link "Cancel", href: appointment_path(appointment)
    }.to change(Appointment, :count).by(-1)

    expect(page).to have_content("Appointment was successfully destroyed.")
  end

  
end