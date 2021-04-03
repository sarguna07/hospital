module Api
  module V1
    class RolesController < ApplicationController
      def index
        render json: {
          status: true,
          data: Role.all.as_json
        }
      end

      def create
        ActiveRecord::Base.transaction do
          role = Role.create!(create_params)
        end
        render json: {
          status: true,
          message: 'Saved Successfully..!'
        }
      end

      def update
        ActiveRecord::Base.transaction do
          role = Role.find_by(id: params[:id])
          role.update_attributes!(update_params)
        end
        render json: {
          status: true,
          message: 'Saved Successfully..!'
        }
      end

      private

      def create_params
        params.require(:roles).permit(:name, :status)
      end

      def update_params
        params.require(:roles).permit(:name, :status)
      end
    end
  end
end
