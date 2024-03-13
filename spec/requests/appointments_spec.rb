require 'rails_helper'

RSpec.describe AppointmentsController, type: :request do
  describe 'GET /appointments' do
    context 'when signin a doctor' do
      let(:doctor) { create(:user, role: 'doctor') }

      before do
        sign_in doctor
        get appointments_path
      end

      it 'returns a successful response' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'when signin a patient' do
      let(:patient) { create(:user, role: 'patient') }

      before do
        sign_in patient
        get appointments_path
      end

      it 'returns a successful response' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'when user is not authenticated' do
      before { get appointments_path }

      it 'redirects to sign in page' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST /appointments' do
    let(:doctor) { create(:user, role: 'doctor') }
    let(:patient) { create(:user, role: 'patient') }

    context 'when user is authenticated and provides valid params' do
      before do
        sign_in patient
      end

      it 'creates a new appointment and redirects to the appointment show page' do      
        expect {
          post appointments_path, params: {
            appointment: {
              patient_id: patient.id,
              doctor_id: doctor.id,
              date: Date.today,
              time: Time.now,
              photo1: fixture_file_upload('spec/fixtures/files/photo.jpg', 'image/jpeg'),
              photo2: fixture_file_upload('spec/fixtures/files/photo.jpg', 'image/jpeg'),
              photo3: fixture_file_upload('spec/fixtures/files/photo.jpg', 'image/jpeg')
            }
          }
        }.to change(Appointment, :count).by(1)
      end
      it 'redirects to the appointment show page' do
        post appointments_path, params: {
            appointment: {
              patient_id: patient.id,
              doctor_id: doctor.id,
              date: Date.today,
              time: Time.now,
              photo1: fixture_file_upload('spec/fixtures/files/photo.jpg', 'image/jpeg'),
              photo2: fixture_file_upload('spec/fixtures/files/photo.jpg', 'image/jpeg'),
              photo3: fixture_file_upload('spec/fixtures/files/photo.jpg', 'image/jpeg')
            }
          }
        expect(response).to redirect_to(appointment_path(Appointment.last))
      end

      context 'when user is authenticated and provides invalid params' do
        before do
          sign_in patient
        end

        it 'does not create a new appointment' do
          expect {
            post appointments_path, params: { appointment: { patient_id: nil, doctor_id: nil, date: nil, time: nil, photo1: nil, photo2: nil, photo3: nil } }
          }.to_not change(Appointment, :count)
          end
        it 'renders the new appointment form again' do
          post appointments_path, params: { appointment: { patient_id: nil, doctor_id: nil, date: nil, time: nil, photo1: nil, photo2: nil, photo3: nil } }
          expect(response).to render_template(:new)
        end
        it 'returns a status of unprocessable entity' do
          post appointments_path, params: { appointment: { patient_id: nil, doctor_id: nil, date: nil, time: nil, photo1: nil, photo2: nil, photo3: nil } }
          expect(response).to have_http_status(:unprocessable_entity)
        end

      end
    end
  
  end

end
