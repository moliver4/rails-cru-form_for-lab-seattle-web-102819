class ArtistsController < ApplicationController
	before_action :set_artist, only:[:show, :edit, :update, :destroy]
	def index
		@artists = Artist.all
	end

	def show
		# @artist = Artist.find(params[:id])
	end

	def new
		@artist = Artist.new
	end

	def create
	  @artist = Artist.new(artist_params)
	  @artist.save
	  redirect_to artist_path(@artist)
	end

	def edit
		@artist = Artist.find(params[:id])
	end

	def update
	  @artist = Artist.find(params[:id])
	  @artist.update(artist_params)
	  redirect_to artist_path(@artist)
	end

	private
		def set_artist
			@artist = Artist.find(params[:id])
		end
		def artist_params
			params.require(:artist).permit(:name, :bio)
		end
end