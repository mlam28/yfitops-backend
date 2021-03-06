class PlaylistsController < ApplicationController

    def create
        playlist = Playlist.create(playlist_params) 
        playlist_data = {name: playlist.name, id: playlist.id, uri: '', images: [{url: playlist.image}], songs: []} 

        render json: playlist_data
    end


    def show
        playlist = Playlist.find(params[:id])
        user_id = params[:user_id]
        users = playlist.users.find_all do |user|
            user_id.to_i != user.id
        end
       
        formatted = users.map do |user|
            {name: user.display_name, spotify_uri: user.spotify_uri, spotify_id: user.spotify_id, id: user.id}
        end
        
        render json: formatted
    end

    def destroy
        playlist = Playlist.find(params[:id])
        playlist.destroy
        render json: {message: 'successfully deleted'}
    end


    private

    def playlist_params
        params.require(:playlist).permit(:name, :playlist_spotify_id, :image, user_ids: [])
    end
end
