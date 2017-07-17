class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  before_filter :redirect_if_old

  def initialize_cart
    @cart = Cart.build_from_hash(session)
  end

  def redirect_if_old
    if request.host == 'www.conteumagazine.co.za' || request.host == 'conteumagazine.co.za'
      redirect_to "#{request.protocol}conteu.com", :status => :moved_permanently
    end
  end
end
