import 'package:comics_app/models/episode_model.dart';
import 'package:comics_app/models/comics/comics_details_model.dart';
import 'package:comics_app/models/comics/comics_list_model.dart';
import 'package:comics_app/models/movies/movies_details_model.dart';
import 'package:comics_app/models/movies/movies_list_model.dart';
import 'package:comics_app/models/personnage/personnage_model.dart';
import 'package:comics_app/models/preview_model.dart';
import 'package:comics_app/models/series/serie_list_model.dart';
import 'package:comics_app/models/series/series_details_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_request.g.dart';

@RestApi()
abstract class APIrequest {
  factory APIrequest(Dio dio, {required String baseUrl}) = _APIrequest;

  @GET('movies')
  Future<PreviewModel> getMoviesPreview(@Query('limit') int limit);

  @GET('movies')
  Future<MoviesListModel> getMoviesList(@Query('limit') int limit);

  @GET('issues')
  Future<PreviewModel> getComicsPreview(@Query('limit') int limit);

  @GET('issues')
  Future<ComicsListModel> getComicsList(@Query('limit') int limit);

  @GET('series_list')
  Future<PreviewModel> getTvShowsPreview(@Query('limit') int limit);

  @GET('series_list')
  Future<SeriesListModel> getTvShowsList(@Query('limit') int limit);
}

class ContentRequest {
  final APIrequest _api = APIrequest(
      Dio(
        BaseOptions(
          queryParameters: {
            'api_key': 'de36491a32570bc83d91c225f40d3d3e8390df99',
            'format': 'json',
          },
        ),
      ),
      baseUrl: 'https://comicvine.gamespot.com/api/');

  Future<PreviewModel> loadMoviesPreview(int limit) {
    return _api.getMoviesPreview(limit);
  }

  Future<PreviewModel> loadComicsPreview(int limit) {
    return _api.getComicsPreview(limit);
  }

  Future<PreviewModel> loadTvShowsPreview(int limit) {
    return _api.getTvShowsPreview(limit);
  }

  Future<MoviesListModel> loadMoviesList(int limit) {
    return _api.getMoviesList(limit);
  }

  Future<ComicsListModel> loadComicsList(int limit) {
    return _api.getComicsList(limit);
  }

  Future<SeriesListModel> loadTvshowsList(int limit) {
    return _api.getTvShowsList(limit);
  }
}

@RestApi()
abstract class APIfullrequest {
  factory APIfullrequest(Dio dio, {required String baseUrl}) = _APIfullrequest;

  @GET("")
  Future<MoviesDetailsModel> getMovies(@Query('limit') int limit);

  @GET("")
  Future<ComicsDetailsModel> getComics(@Query('limit') int limit);

  @GET("")
  Future<SeriesDetailsModel> getSeries(@Query('limit') int limit);

  @GET("")
  Future<PersonnageModel> getPersonnage(@Query('limit') int limit);

  @GET("")
  Future<EpisodeModel> getEpisode(@Query('limit') int limit);
}

class DetailsRequest {
  final APIfullrequest _apifull;

  DetailsRequest(String baseUrl)
      : _apifull = APIfullrequest(
          Dio(
            BaseOptions(
              queryParameters: {
                'api_key': 'de36491a32570bc83d91c225f40d3d3e8390df99',
                'format': 'json',
              },
            ),
          ),
          baseUrl: baseUrl,
        );

  Future<MoviesDetailsModel> loadMovies() {
    return _apifull.getMovies(1);
  }

  Future<ComicsDetailsModel> loadComics() {
    return _apifull.getComics(1);
  }

  Future<SeriesDetailsModel> loadSeries() {
    return _apifull.getSeries(1);
  }

  Future<PersonnageModel> loadPersonnage() {
    return _apifull.getPersonnage(1);
  }

  Future<EpisodeModel> loadEpisode(int limit) {
    return _apifull.getEpisode(limit);
  }
}

@RestApi()
abstract class APIsearchrequest {
  factory APIsearchrequest(Dio dio, {required String baseUrl}) = _APIsearchrequest;

  @GET("movies")
  Future<PreviewModel> getMoviesSearch(@Query('limit') int limit, @Query('filter') String filter);

  @GET("issues")
  Future<PreviewModel> getComicsSearch(@Query('limit') int limit, @Query('filter') String filter);

  @GET("series_list")
  Future<PreviewModel> getSeriesSearch(@Query('limit') int limit, @Query('filter') String filter);

  @GET("characters")
  Future<PreviewModel> getPersonnageSearch(@Query('limit') int limit, @Query('filter') String filter);
}

class SearchRequest {
  final APIsearchrequest _apisearch;
  final String search;

  SearchRequest(this.search)
      : _apisearch = APIsearchrequest(
          Dio(
            BaseOptions(
              queryParameters: {
                'api_key': 'de36491a32570bc83d91c225f40d3d3e8390df99',
                'format': 'json',
              },
            ),
          ),
          baseUrl: "https://comicvine.gamespot.com/api/",
        );

  Future<PreviewModel> loadMovies() {
    return _apisearch.getMoviesSearch(5, 'name:$search');
  }

  Future<PreviewModel> loadComics() {
    return _apisearch.getComicsSearch(5, 'name:$search');
  }

  Future<PreviewModel> loadSeries() {
    return _apisearch.getSeriesSearch(5, 'name:$search');
  }

  Future<PreviewModel> loadPersonnage() {
    return _apisearch.getPersonnageSearch(5, 'name:$search');
  }
}

