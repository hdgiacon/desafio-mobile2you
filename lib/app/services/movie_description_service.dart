abstract class MovieDescriptionService {
  Future<Map> getMovie();
  Future<List> getSimilarMovie();
  Future<List> getAllGenres();
}
