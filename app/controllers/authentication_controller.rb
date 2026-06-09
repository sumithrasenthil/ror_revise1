class AuthenticationController < ApplicationController
    def sign_up
        user = User.new(user_params)
        if user.save
            render json: { message: "User created successfully" }, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end


    def sign_in
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            render json: { message: "Sign in successful" }, status: :ok
        else
            render json: { error: "Invalid email or password" }, status: :unauthorized
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :mobile_number, :country_code, :password, :password_confirmation)
    end
end
