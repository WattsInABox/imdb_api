imdb_api
====

Access to IMDB through imdbapi.org. Note that I am not affiliated with IMDB, imdb.com, or imdbapi.org. This product is release under the GNU V3 License. If you don't know what that means, read the license file.

Basically, because of the restrictions on imdbapi.org, this gem CANNOT be used for profit in any way.

usage
====

    ImdbApi::Search.by_id(1) # {title: 'Carmencita', imdb_id: 'tt0000001', ...}
    ImdbApi::Search.by_title('Carmencita', limit: 5) # [{title: 'Carmencita'...} ...]

contributing
====

1. Fork
2. Edit, Test (!!!), Document
3. Pull request a NAMED feature branch
4. Profit
