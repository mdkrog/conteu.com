class ViewPointObjectsController < ApplicationController
  before_action :require_login
  before_action :set_view_point_object, only: [:edit, :update, :destroy]

  def new
    @view_point_object = ViewPointObject.new
  end

  def create
    @view_point_object = ViewPointObject.new(view_point_object_params)
    if @view_point_object.save
      redirect_to admin_path, notice: 'View Point Object was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @view_point_object.update(view_point_object_params)
      redirect_to admin_path, notice: 'View Point Object was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @view_point_object.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: 'View Point Object was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_view_point_object
    @view_point_object = ViewPointObject.find(params[:id])
  end

  def view_point_object_params
    params.require(:view_point_object).permit(:name, :displayed)
  end
end
