class ApartmentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

    def index
        apartments = Apartment.all
        render json: apartments, status: :ok
    end

    def show
        apartment = find_apartment
        render json: apartment, status: :ok
    end 

    def create 
        apartment = Apartment.create!(apartment_params)
        render json: apartment, status: :created
    end

    def update
        apartment = find_apartment
        apartment.update!(apartment_params)
        render json: apartment, status: :accepted
    end

    def destroy
        apartment = find_apartment
        apartment.destroy
        head :no_content
    end

    private

    def find_apartment
        Apartment.find(params[:id])
    end

    def apartment_params
        params.permit(:number)
    end

    def record_not_found_response
        render json: {error: "Apartment Not Found"}, status: :not_found
    end

    def unprocessable_entity(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
