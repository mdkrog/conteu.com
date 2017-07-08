class StoriesController < ApplicationController
  before_action :require_login, except: [:show]
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def show
    # only allow signed in users to see non-published issues
    if !@story.issue.published? && !signed_in?
      redirect_to root_path
    end
  end

  def new
    @story = Story.new
  end

  def edit
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to @story, notice: 'Story was successfully created.'
    else
      render :new
    end
  end

  def update
    if @story.update(story_params)
      redirect_to @story, notice: 'Story was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: 'Story was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def set_story
    # @story = Story.friendly.find(params[:id])
    @story = Story.includes(:issue).friendly.find(params[:id])
  end

  def story_params
    # permitted = params.require(:story).permit(:title,
    #                               :slug,
    #                               :blurb,
    #                               :published,
    #                               :featured_image,
    #                               :optimized_html,
    #                               :issue_id,
    #                               :color_scheme,
    #                               :order,
    #                               components_attributes: [:id,
    #                                 :order,
    #                                 :type,
    #                                 :settings,
    #                                 :_destroy])
    # permitted[:components_attributes] = params[:story][:components_attributes].permit!
    # permitted
    permitted = params.require(:story).permit(:title,
                                              :slug,
                                              :issue_id,
                                              :author_id,
                                              :page_number,
                                              :contents_page_layout,
                                              :contents_page_image,
                                              :contents_page_blurb)
  end
end
