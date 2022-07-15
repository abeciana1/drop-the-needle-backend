class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :session_renew, :check_email, :change_password]
    before_action :authorized, only: [:show], if: -> { @current_user }

    def index
        users = User.all
        render :json => users, each_serializer: UserSerializer
    end

    def show
        user = User.find(params[:id])
        render :json => user, each_serializer: UserSerializer
    end

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def session_renew
        user_id = current_user[:id]
        token = encode_token({ user_id: user_id })
        cookies.signed[:jwt] = {
            value: token,
            httponly: true,
            expires: 1.hour.from_now
        }
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end
end
