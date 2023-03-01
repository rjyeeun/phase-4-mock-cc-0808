class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    def index
        render json: Camper.all, status: :ok
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, status: :ok
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: 201
    end

    private

    def camper_params
        params.permit(:name, :age, :activities)
    end

    def record_not_found
        render json: {error: "Camper not found"}, status: 404
    end

    def render_unprocessable_entity invalid 
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity        
    end


end
