class AppointmentsController < ApplicationController
    before_action :authenticate_user!#, only: %i[new create edit update destroy]
    before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  
    # GET /appointments
    def index
      #@appointments = Appointment.all
      if current_user.role == "doctor"
        @appointments = current_user.appointments_as_doctor
      end
      if current_user.role == "patient"
        @appointments = current_user.appointments_as_patient
      end
    end
  
    # GET /appointments/1
    def show
    end
  
    # GET /appointments/new
    def new
      @appointment = Appointment.new
    end
  
    # GET /appointments/1/edit
    def edit
    end
  
    # POST /appointments
    def create
      @appointment = Appointment.new(appointment_params)
  
      if @appointment.save
        redirect_to @appointment, notice: 'Appointment was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /appointments/1
    def update
      if @appointment.update(appointment_params)
        redirect_to @appointment, notice: 'Appointment was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    # DELETE /appointments/1
    def destroy
      @appointment.destroy
      redirect_to appointments_url, notice: 'Appointment was successfully destroyed.'
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_appointment
        @appointment = Appointment.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def appointment_params
        params.require(:appointment).permit(:patient_id, :doctor_id, :date, :time, :photo1, :photo2, :photo3)
      end
  end
  