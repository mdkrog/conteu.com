class IssuesController < ApplicationController
  before_action :require_login, except: [:show]
  before_action :set_issue, only: [:edit, :update, :destroy]

  def index
    @issues = Issue.where(published: true).order(release_date: :desc)
  end

  def show
    @fixed_nav = true
    @issue = Issue.includes(:stories).friendly.find_by_friendly_id(params[:id])

    # only allow signed in users to see non-published issues
    if !@issue.published? && !signed_in?
      redirect_to root_path
    end
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      redirect_to @issue, notice: 'Issue was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @issue.update(issue_params)
      redirect_to @issue, notice: 'Issue was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: 'Issue was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_issue
    @issue = Issue.friendly.find_by_friendly_id(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:title, :release_date, :issue_number, :published, :cover_thumbnail, :blurb)
  end
end
