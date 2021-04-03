module Api
  module V1
    class PatientsController < ApplicationController
      def index
        patient = Patient.search_records(params) if current_user&.roles&.where(name: 'Admin').present?
        render json: {
          status: true,
          data: patient.present? ? patient : []
        }
      end

      def show
        data = Patient.find(params[:id])
        render json: {
          status: true,
          data: current_user&.roles&.where(name: 'Admin').present? ? data : []
        }
      end

      def create
        data = Patient.create!(create_params)
        render json: {
          status: true,
          message: 'Saved Successfully..!',
          data: data
        }
      end

      def update
        if current_user&.roles&.where(name: 'Admin').present?
          patient = Patient.find_by(id: params[:id])
          patient.update_attributes!(update_params)
        end
        render json: {
          status: true,
          message: 'Saved Successfully..!',
          data: patient.present? ? patient : []
        }
      end

      private

      def create_params
        params.require(:patients).permit(:name, :dob, :email, :blood_group, :test_date)
      end

      def update_params
        params.require(:patients).permit(:name, :dob, :email, :blood_group, :test_date, :inference, :result)
      end
    end
  end
end
