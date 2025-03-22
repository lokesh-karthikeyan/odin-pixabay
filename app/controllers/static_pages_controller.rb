class StaticPagesController < ApplicationController
  def pixabay_search
    service = PixabayService.new
    @search_content = params[:query_string]
    http_response = service.pixabay_url_builder(@search_content)
    @images = service.fetch_image_urls(http_response)
  end
end
