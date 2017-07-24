class ViewPointTriviaController < ApplicationController
  before_action :require_login
  before_action :set_view_point_trivia, only: [:edit, :update, :destroy]

  def new
    @view_point_trivium = ViewPointTrivium.new
  end

  def create
    @view_point_trivium = ViewPointTrivium.new(view_point_trivium_params)
    if @view_point_trivium.save
      redirect_to admin_path, notice: 'View Point Trivia was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @view_point_trivium.update(view_point_trivium_params)
      redirect_to admin_path, notice: 'View Point Trivia was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @view_point_trivium.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: 'View Point Trivia was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_view_point_trivia
    @view_point_trivium = ViewPointTrivium.find(params[:id])
  end

  def view_point_trivium_params
    params.require(:view_point_trivium).permit(:view_point_object_id, :showcase_date, :description)
  end
end
