class PagesController < ApplicationController
  before_action :require_login, only: [:admin]

  def home
  end

  def admin
    @issues = Issue.all.includes(:stories).order(issue_number: :asc)
    @orphaned_stories = Story.where('issue_id NOT IN (?)', Issue.pluck("id"))
    @friend_products = FriendProduct.all.order(sort_order: :asc)
  end
end
