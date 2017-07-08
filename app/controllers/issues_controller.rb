class IssuesController < ApplicationController
  before_action :require_login, except: [:show]
  # before_action :set_issue, only: [:show, :edit, :update, :destroy]

  def show
    @issue = Issue.includes(:stories).find(params[:id])

    # only allow signed in users to see non-published issues
    if !@issue.published? && !signed_in?
      redirect_to root_path
    end
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
