class PagesController < ApplicationController
  before_action :require_login, only: [:admin]
  before_action :initialize_cart, only: [:store]

  def home
    @fixed_nav = true
    @main_nav = true
  end

  def viewpoint
    @view_point_artist = ViewPointArtist.where("showcase_date <= ?", Date.today).first
    @all_objects = ViewPointObject.all.order(sort_order: :desc)
    @next_artist = @view_point_artist.previous
    @previous_artist= @view_point_artist.next

    if @view_point_artist.nil?
      render 'viewpoint'
    else
      render 'view_point_artists/show'
    end
    # only allow signed in users to see non-published view_point_artists
    # if !@view_point_artist.published? && !signed_in?
    #   ren viewpoint_path
    # end
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
    @view_point_objects = ViewPointObject.all.includes(:view_point_artists).order(sort_order: :asc)
    @view_point_artists = ViewPointArtist.all.includes(:view_point_object).order(showcase_date: :desc)
    @orphaned_view_point_artists = ViewPointArtist.where('view_point_object_id NOT IN (?)', ViewPointObject.pluck("id"))
  end
end
