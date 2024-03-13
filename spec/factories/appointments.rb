FactoryBot.define do
  factory :appointment do
    association :patient, factory: :user
    association :doctor, factory: :user
    date { "2024-03-12" }
    time { "10:00 AM" }
    photo1 { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures','files', 'photo.jpg'), 'image/jpeg') }
    photo2 { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files','photo.jpg'), 'image/jpeg') }
    photo3 { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files','photo.jpg'), 'image/jpeg') }
  end
end