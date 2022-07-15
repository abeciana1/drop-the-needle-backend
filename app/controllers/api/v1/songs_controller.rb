class Api::V1::SongsController < ApplicationController
    before_action :authorized, only: [:create, :show, :delete], if: -> { @current_user }

    def show
        song = Song.find(params[:id])
        render :json => song, each_serializer: SongSerializer
    end

    def create
        song = Song.create(song_params)
        if song.valid?
            render :json => { song: SongSerializer.new(song) }, status: :created
        else
            render :json => { error: 'failed to create song'}, status: :not_acceptable
        end
    end

    def update
        song = Song.find(params[:id])
        song.update(song_params)
        render :json => song, each_serializer: SongSerializer
    end

    def delete
        song = Song.find(params[:id])
        song.destroy
        render json: {}
    end

    private

    def song_params
        params.permit(
            
        )
    end
end
