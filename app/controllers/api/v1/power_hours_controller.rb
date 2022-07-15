class Api::V1::PowerHoursController < ApplicationController
    # before_action :authorized, only: [:create, :index, :show, :youtube_import, :update], if: -> { @current_user }
    before_action :authorized, only: [:create, :show, :youtube_import, :update], if: -> { @current_user }

    def index
        playlists =  PowerHour.all
        render :json => playlists, each_serializer: PowerHourSerializer
    end

    def show
        playlist = PowerHour.find(params[:id])
        render :json => playlist, each_serializer: PowerHourSerializer
    end

    def create
        playlist = PowerHour.create(playlist_params)
        
        if playlist.valid?
            if params["playlist"]["pic"] != ''
                cloud = Cloudinary::Uploader.upload(params["playlist"]["pic"])
                playlist.image = cloud["url"]
                playlist.save
            end
            render :json => { playlist: PowerHourSerializer.new(playlist)}, status: :created
        else
            render :json => { error: 'failed to create playlist'}, status: :not_acceptable
        end
    end

    def youtube_import
        youtube_id = params["youtube"]["youTubePlaylist"]
        ph_id = params["power_hour"]
        playlist = PowerHour.get_youtube_songs(youtube_id, ph_id)
        found_playlist = PowerHour.find(ph_id)
        render json: found_playlist.songs
    end

    def update
        playlist = PowerHour.find(params[:id])

        # ! for cover image upload
        # if (params["playlist"]["pic"] != '')
        #     cloud = Cloudinary::Uploader.upload(params["playlist"]["pic"])
        #     playlist.image = cloud["url"]
        #     playlist.save
        # end

        playlist.update(playlist_params)


        # playlist.update(params)
        render :json => playlist, each_serializer: PowerHourSerializer
    end

    # def search_youtube
    #     search_term = params["searchTerm"].split(" ").join("+")
    #     PowerHour.search_scraper(search_term)
    # end

    def delete
        playlist = PowerHour.find(params[:id])
        playlist.destroy
        render json: {}
    end

    private

    def playlist_params
        params.permit(
            :title,
            :description,
            :cover_image,
            :date_time
        )
    end
end
