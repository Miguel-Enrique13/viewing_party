class MovieService
  def top_rated
    aggregate('movie/top_rated')
  end

  def search(query)
    params = { query: query }
    aggregate('search/movie', params)
  end

  def aggregate(url, params = {})
    movies = []
    page = 0
    while movies.size < 40
      page += 1
      params[:page] = page
      page_content = to_json(url, params)[:results]
      (movies << page_content).flatten!
      break if movies.include?(nil) || page_content.size < 20
    end
    movies
  end

  def to_json(url, params = {})
    response = conn.get(url) do |req|
      req.params = params
      req.params['api_key'] = ENV['TMDB_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: 'https://api.themoviedb.org/3/')
  end
end
