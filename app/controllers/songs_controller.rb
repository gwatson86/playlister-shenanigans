class SongsController < ApplicationController

    get '/songs' do
        erb :'songs/index'
    end

    get '/songs/new' do
        erb :'songs/new'
    end

    post '/songs' do
        art = Artist.find_or_create_by name: params['artist']
        params["artist"] = art
        @song = Song.create(params)
        redirect '/songs'
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end
end