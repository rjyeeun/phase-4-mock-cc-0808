class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :signup_not_valid
    
    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: 201
    end

    private 

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def signup_not_valid 
        render json: {"errors": ["validation errors"]}, status: 422
    end
end
