require 'pry'

class HostsController < ApplicationController

    def create
        binding.pry
        host = Host.create(host_params)
        if host.valid?
            render json: { host: HostSerializer.new(host) }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    private

    params.permit(
        :user_id,
        :power_hour_id
    )
end
