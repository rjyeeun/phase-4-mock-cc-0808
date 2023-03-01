class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :signup_not_valid

    def create
        signup = Signup.create(signup_params)
        render json: signup, status: 201
    end

    private 

    def signup_not_valid 
        render json: {error: "validation errors"}, status: :unprocessable_entity
    end

    def signup_params
        params.permit(:camper_id, :activity_id, :time, :activities)
    end
end
