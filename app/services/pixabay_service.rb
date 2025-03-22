class PixabayService
  BASE_URL = "https://pixabay.com/api/"
  IMAGE_TYPE = "photo"
  PER_PAGE = 10

  def pixabay_url_builder(query_string)
    return if query_string.nil? || query_string.blank?

    url = "#{BASE_URL}?key=#{Rails.application.credentials.pixabay.api_key}&q=#{query_string}&image_type=#{IMAGE_TYPE}&per_page=#{PER_PAGE}"
    response = RestClient.get(url)
    JSON.parse(response.body)
  rescue RestClient::ExceptionWithResponse => e
    { "error" => e.response }
  end

  def fetch_image_urls(url)
    return if url.nil?

    results = url["hits"]
    results.map { |result| result["largeImageURL"] }
  end
end
