import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comics_app/API/api_request.dart';
import 'package:comics_app/API/gamespot_api.dart';


///Bloc de récupération des previews (page d'acceuil)
// Définition de l'événement
abstract class PreviewEvent {}

class LoadAllContentPreviewEvent extends PreviewEvent {}

// Définition des états
abstract class PreviewState {
  final dynamic response;

  PreviewState(this.response);
}

class LoadingPreviewState extends PreviewState {
  LoadingPreviewState() : super(null);
}

class SuccessPreviewState extends PreviewState {
  final Map<String, dynamic> contentByType;

  SuccessPreviewState(this.contentByType) : super(null);
}

class ErrorPreviewState extends PreviewState {
  final dynamic exception;

  ErrorPreviewState(this.exception) : super(null);
}

// Bloc
class PreviewBloc extends Bloc<PreviewEvent, PreviewState> {
  PreviewBloc() : super(LoadingPreviewState()) {
    on<LoadAllContentPreviewEvent>(_onLoadAllContentPreview);
  }

  Future<void> _onLoadAllContentPreview(
    LoadAllContentPreviewEvent event,
    Emitter<PreviewState> emit,
  ) async {
    emit(LoadingPreviewState());
    try {
      final Map<String, dynamic> contentByType = {};

      // Charger les séries
      var tvShows = await ContentRequest().loadTvShowsPreview(5);
      contentByType['serie'] = tvShows;

      // Charger les comics
      var comics = await ContentRequest().loadComicsPreview(5);
      contentByType['comics'] = comics;

      // Charger les films
      var movies = await ContentRequest().loadMoviesPreview(5);
      contentByType['films'] = movies;

      // Charger les actualités
      var events = await EventRequest().loadEvents();
      contentByType['actu'] = events;

      emit(SuccessPreviewState(contentByType));
    } catch (e) {
      emit(ErrorPreviewState(e.toString()));
    }
  }
}
