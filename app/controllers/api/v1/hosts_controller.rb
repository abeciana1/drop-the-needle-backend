require 'pry'

class HostsController < ApplicationController

    def create
        # binding.pry
        host = Host.create(host_params)
        if host.valid?
            render json: { host: HostSerializer.new(host) }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def update
        host = Host.find(params[:id])
        host.update(host_params)
        render :json => host, each_serializer: HostSerializer
    end
    
    def delete
        host = Host.find(params[:id])
        host.destroy
        render json: {}
    end

    private

    def host_params
        params.permit(
            :user_id,
            :power_hour_id
        )
    end
end
