import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comics_app/API/api_request.dart';


///Bloc de récupération des recherches 
// Événements
abstract class SearchEvent {}

class SearchSubmitted extends SearchEvent {
  final String query;
  SearchSubmitted(this.query);
}

// États
abstract class SearchState {}

class LoadingSearchState extends SearchState {}

class SearchInitialState extends SearchState {}

class SuccessSearchState extends SearchState {
  final Map<String, dynamic> contentByType;
  SuccessSearchState(this.contentByType);
}

class ErrorSearchState extends SearchState {
  final String message;
  ErrorSearchState(this.message);
}

// Bloc
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitialState()) { 
    on<SearchSubmitted>(_onSearchSubmitted);
  }

  Future<void> _onSearchSubmitted(
    SearchSubmitted event,
    Emitter<SearchState> emit,
  ) async {
    emit(LoadingSearchState());
    try {
      final Map<String, dynamic> contentByType = {};

      var tvShows = await SearchRequest(event.query).loadSeries();
      contentByType['serie'] = tvShows;

      var comics = await SearchRequest(event.query).loadComics();
      contentByType['comics'] = comics;

      var movies = await SearchRequest(event.query).loadMovies();
      contentByType['films'] = movies;

      var personnages = await SearchRequest(event.query).loadPersonnage();
      contentByType['personnage'] = personnages;

      emit(SuccessSearchState(contentByType));
    } catch (e) {
      emit(ErrorSearchState(e.toString()));
    }
  }
}
