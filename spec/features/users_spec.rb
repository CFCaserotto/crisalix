require 'rails_helper'

RSpec.describe 'User', type: :system do

  it 'can sign up' do
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Password', with: 'password123'
    fill_in 'Password confirmation', with: 'password123'
    click_button 'Sign up'
    expect(page).to have_content 'WELLCOME TO CRISALIX'
  end

  let!(:user) { create(:user, email: 'test@example.com', password: 'password123') }

  it 'can sign in' do
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password123'
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
  end
end