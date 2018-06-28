class PagesController < ApplicationController
  before_action :require_login, only: [:admin]
  before_action :initialize_cart, only: [:store]

  def home
    @fixed_nav = true
    @latest_issue = Issue.where(published: true).order(release_date: :desc).first
  end

  def viewpoint
    # @newsletter_pop_up = true
    @view_point_artist = ViewPointArtist.where("showcase_date <= ?", Date.today).first
    @all_objects = ViewPointObject.all.order(sort_order: :desc)

    if @view_point_artist.nil?
      render 'viewpoint'
    else
      @next_artist = @view_point_artist.previous
      @previous_artist= @view_point_artist.next
      render 'view_point_artists/show'
    end
    # only allow signed in users to see non-published view_point_artists
    # if !@view_point_artist.published? && !signed_in?
    #   ren viewpoint_path
    # end
  end

  def store
    @products = Product.where(displayed: true, featured: false, deleted: false).order(sort_order: :asc)
    @featured_product =  Product.where(displayed: true, featured: true).first
    @friend_products = FriendProduct.where(displayed: true).order(sort_order: :asc)
  end

  # def newsletter
  # end

  # def submissions
  # end

  def contact
  end

  def about
  end

  def admin
    @issues = Issue.all.includes(:stories).order(release_date: :desc)
    @orphaned_stories = Story.where('issue_id NOT IN (?)', Issue.pluck("id"))
    @products = Product.where(deleted: false).order(sort_order: :asc)
    @friend_products = FriendProduct.all.order(sort_order: :asc)
    @orders = Order.where(status: :paid).order(created_at: :desc)
    @view_point_objects = ViewPointObject.all.includes(:view_point_artists).order(sort_order: :asc)
    @view_point_artists = ViewPointArtist.all.includes(:view_point_object).order(showcase_date: :desc)
    @orphaned_view_point_artists = ViewPointArtist.where('view_point_object_id NOT IN (?)', ViewPointObject.pluck("id"))
  end
end
