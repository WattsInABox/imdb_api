module ImdbApi
  class Search
    class << self
      def by_id(id, options={})
        options ||= {}
        options = base_options.dup.merge(options)

        id = "tt#{id}"  unless id =~ /^tt/
        options[:id] ||= URI::escape(id)

        id_url = "http://imdbapi.org/?#{options.to_param}"
        movie = get_and_parse(id_url)

        raise MovieNotFound  if error_code?(movie)
        movie
      end

      def by_title(title, options={})
        options ||= {}
        options = base_options.dup.merge(options)
        options[:limit] ||= 1
        options[:yg] ||= 0
        options[:mt] ||= 'none'
        options[:title] ||= URI::escape(title)
        
        title_url = "http://imdbapi.org/?#{options.to_param}"
        movies = get_and_parse(title_url)

        raise MovieNotFound  if movies.is_a?(Hash) && error_code?(movies)
        movies
      end

      protected 

      def get_and_parse(url)
        JSON(RestClient.get(url))
      end

      # these options are shared between searches by_id and searches by_title
      def base_options
        {type: 'json', plot: 'simple', episode: 0, lang: 'en-US', 
          aka: 'simple', release: 'simple', business: 0, tech: 0}
      end

      def error_code?(movie)
        movie["code"] && movie["code"].to_i > 200
      end
    end
  end
end
