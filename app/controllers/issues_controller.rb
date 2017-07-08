class IssuesController < ApplicationController
  # before_action :require_login, except: [:show, :index]
  # before_action :set_issue, only: [:show, :edit, :update, :destroy, :preview]

  def show
    @issue = Issue.includes(:stories).find(params[:id])
    # if !@issue.published? && !signed_in?
    #   redirect_to issues_path
    # end
    render layout: 'contents'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_issue
    # @issue = Issue.friendly.find(params[:id])
  # end

  def issue_params
    params.require(:issue).permit(:title, :release_date, :issue_number, :published)
  end
end
