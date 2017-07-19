class SitemapController < ApplicationController
  def index
    @static_pages = [root_url, store_url, viewpoint_url, about_url, contact_url, newsletter_url, submissions_url]
    @stories = Story.all
    @issues = Issue.where(published: true)
    respond_to do |format|
     format.xml
    end
  end
end
