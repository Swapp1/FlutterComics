import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comics_app/API/api_request.dart';


///Bloc de récupération des détails
// Événements
abstract class DetailsEvent {}

class LoadContentDetailsEvent extends DetailsEvent {
  final String contentType;
  final String searchString;

  LoadContentDetailsEvent(this.contentType, this.searchString);
}

// États
abstract class DetailsState {
  final dynamic response;

  DetailsState(this.response);
}

class LoadingDetailsState extends DetailsState {
  LoadingDetailsState() : super(null);
}

class SuccessDetailsState extends DetailsState {
  final dynamic content;

  SuccessDetailsState(this.content) : super(null);
}

class ErrorDetailsState extends DetailsState {
  final String message;

  ErrorDetailsState(this.message) : super(null);
}

// Bloc
class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(LoadingDetailsState()) {
    on<LoadContentDetailsEvent>(_onLoadContentDetails);
  }

  Future<void> _onLoadContentDetails(
    LoadContentDetailsEvent event,
    Emitter<DetailsState> emit,
  ) async {
    emit(LoadingDetailsState());
    try {
      dynamic content;
      switch (event.contentType) {
        case 'serie':
          content = await DetailsRequest(event.searchString).loadSeries();
          break;
        case 'comics':
          content = await DetailsRequest(event.searchString).loadComics();
          break;
        case 'films':
          content = await DetailsRequest(event.searchString).loadMovies();
          break;
        case 'personnage':
          content = await DetailsRequest(event.searchString).loadPersonnage();
          break;
        default:
          throw 'Type de contenu non supporté';
      }
      emit(SuccessDetailsState(content));
    } catch (e) {
      emit(ErrorDetailsState(e.toString()));
    }
  }
}
