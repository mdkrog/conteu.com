class PagesController < ApplicationController
  def home
  end

  def example
    render layout: 'contents_layout'
  end
end
