class PagesController < ApplicationController
  before_action :require_login, only: [:admin]

  def home
    @fixed_nav = true
    @main_nav = true
  end

  def viewpoint
  end

  def store
    @products = Product.where(displayed: true).order(sort_order: :asc)
    @friend_products = FriendProduct.where(displayed: true).order(sort_order: :asc)
  end

  def admin
    @issues = Issue.all.includes(:stories).order(issue_number: :asc)
    @orphaned_stories = Story.where('issue_id NOT IN (?)', Issue.pluck("id"))
    @products = Product.all.order(sort_order: :asc)
    @friend_products = FriendProduct.all.order(sort_order: :asc)
  end
end
