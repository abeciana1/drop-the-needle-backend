require 'pry'

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
            expires: 1.hour.from_now,
        }
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
        user = User.create(user_params)
        if user.valid?
            token = encode_token(user_id: user.id)
            cookies.signed[:jwt] = {
                value: token, 
                httponly: true,
                expires: 1.hour.from_now,
            }
            render json: { user: UserSerializer.new(user), jwt: token }, status: :created
        else
            #! look into custom error messaging
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    # ! Try again later
    # def check_email
    #     if user_params[:email].blank?
    #         return render json: {error: 'Email not present'}
    #     end

    #     user = User.find_by(email: user_params[:email])
    #     if user.valid?
    #         user.generate_password_token!
    #         #! SEND EMAIL HERE via sendgrid
    #         SendGrid.send_forgot_password(user.email, user,"d-302fe0775770410faf7d59800cbc8d34")
    #         render json: {user: UserSerializer.new(user)}, status: :accepted
    #     else
    #         render json: { error: 'failed to find user' }, status: :not_acceptable
    #     end
    # end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render :json => user, each_serializer: UserSerializer
    end
    
    def delete
        user = User.find(params[:id])
        user.destroy
        render json: {}
    end

    private

    def user_params
        params.require(:userData).permit(
            :name,
            :email,
            :password
        )
    end
end
