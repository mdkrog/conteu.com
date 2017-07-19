class PagesController < ApplicationController
  before_action :require_login, only: [:admin]
  before_action :initialize_cart, only: [:store]

  def home
    @fixed_nav = true
    @main_nav = true
  end

  def viewpoint
  end

  def store
    @products = Product.where(displayed: true, featured: false).order(sort_order: :asc)
    @featured_product =  Product.where(displayed: true, featured: true).first
    @friend_products = FriendProduct.where(displayed: true).order(sort_order: :asc)
  end

  def newsletter
  end

  def submissions
  end

  def contact
  end

  def about
  end

  def admin
    @issues = Issue.all.includes(:stories).order(issue_number: :asc)
    @orphaned_stories = Story.where('issue_id NOT IN (?)', Issue.pluck("id"))
    @products = Product.all.order(sort_order: :asc)
    @friend_products = FriendProduct.all.order(sort_order: :asc)
  end
end
