require 'pry'

class ParticipantsController < ApplicationController

    def create
        binding.pry
        participant = Participant.create(participant_params)
        if participant.valid?
            render json: { participant: ParticipantSerializer.new(participant) }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def update
        participant = Participant.find(params[:id])
        participant.update(participant_params)
        render :json => participant, each_serializer: ParticipantSerializer
    end
    
    def delete
        participant = Participant.find(params[:id])
        participant.destroy
        render json: {}
    end

    private

    def participant_params
        params.permit(
            :user_id,
            :power_hour_id,
            :confirmed_rsvp
        )
    end
end
