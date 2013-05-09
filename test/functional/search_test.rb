require_relative '../test_helper'

# I'm making this a functional test since it requires the internet
module ImdbApi
  class SearchTest < Test::Unit::TestCase
    context "a search" do
      context "for a movie by ID" do
        should "return the right movie from IDMB" do
          movie = Search.by_id(1)

          assert_equal 'tt0000001', movie['imdb_id']
          assert_equal 'Carmencita', movie['title']
        end

        should "raise MovieNotFound if the ID does not exist" do
          assert_raises MovieNotFound do
            Search.by_id(-1)
          end
        end
      end

      context "for a movie by title" do
        should "return a list of movies, limited in number by a :limit option" do
          movies = Search.by_title('Carmencita', limit: 2)
          assert_equal 2, movies.length
        end

        should "raise MovieNotFound if the title does not exist" do
          assert_raises MovieNotFound do
            Search.by_title('QWERTYUIOPASDJMVNZ')
          end
        end
      end
    end
  end
end