abstract class MovieDescriptionRepository {
  Future<Map> getMovie();
  Future<List> getSimilarMovie();
}
