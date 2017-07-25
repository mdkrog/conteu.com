class ViewPointArtistsController < ApplicationController
  before_action :require_login, except: [:show]
  before_action :set_view_point_artist, only: [:edit, :update, :destroy]

  def show
    @view_point_artist = ViewPointArtist.find(params[:id])
    @view_point_trivium = ViewPointTrivium.find_by(showcase_date: @view_point_artist.showcase_date)
    @all_objects = ViewPointObject.includes(:view_point_artists).all
    @next_artist = @view_point_artist.previous
    @previous_artist= @view_point_artist.next
    # only allow signed in users to see non-published view_point_artists
    if !@view_point_artist.published? && !signed_in?
      redirect_to viewpoint_path
    end
  end


  def new
    @view_point_artist = ViewPointArtist.new
  end

  def create
    @view_point_artist = ViewPointArtist.new(view_point_artist_params)
    if @view_point_artist.save
      redirect_to admin_path, notice: 'View Point Object was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @view_point_artist.update(view_point_artist_params)
      redirect_to admin_path, notice: 'View Point Object was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @view_point_artist.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: 'View Point Object was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_view_point_artist
    @view_point_artist = ViewPointArtist.find(params[:id])
  end

  def view_point_artist_params
    params.require(:view_point_artist).permit(:artwork,
                                              :view_point_object_id,
                                              :description,
                                              :artist_name,
                                              :artist_website,
                                              :artist_instagram,
                                              :showcase_date)
  end
end
