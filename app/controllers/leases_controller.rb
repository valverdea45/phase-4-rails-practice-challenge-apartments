class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response     

    def create
        lease = Lease.create!(lease_params)
        render json: lease, status: :created
    end

    def destroy
        lease = find_lease
        lease.destroy
        head :no_content
    end
    
    private

    def find_lease
        Lease.find(params[:id])
    end

    def lease_params
        params.permit(:apartment_id, :tenant_id, :rent)
    end

    def unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
