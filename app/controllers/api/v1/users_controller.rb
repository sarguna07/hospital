module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: {
          status: true,
          data: User.all.map do |us|
            us.as_json(
              include: {
                roles: { only: %i[id name status] }
              }
            )
          end
        }
      end

      def create
        role_ids = params[:users][:role_ids]
        role_id = Role.find(role_ids) if role_ids.present?
        user = User.create!(allowed_params)
        user.role_ids = role_ids if role_id.present?
        user.save!
        render json: {
          status: true,
          message: 'Saved Successfully..!',
          data: user
        }
      end

      def update
        role_ids = params[:users][:role_ids]
        role_id = Role.find(role_ids) if role_ids.present?
        object.update_attributes!(allowed_params)
        object.role_ids = role_ids if role_id.present?
        object.save!
        render json: {
          status: true,
          message: 'Saved Successfully..!',
          data: object
        }
      end

      private

      def object
        @object ||= User.find_by(id: params[:id])
      end

      def allowed_params
        params.require(:users).permit(:first_name, :last_name, :email, :phone, :password)
      end
    end
  end
end
