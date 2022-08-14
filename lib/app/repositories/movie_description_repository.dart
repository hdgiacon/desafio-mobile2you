abstract class MovieDescriptionRepository {
  Future<Map> getMovie();
  Future<List> getSimilarMovie(List previousList, int page);
  Future<List> getAllGenres();
}
