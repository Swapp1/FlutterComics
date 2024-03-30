import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comics_app/API/api_request.dart';

///Bloc de récupération des listes d'items
// Événements
abstract class ListEvent {}

class LoadContentListEvent extends ListEvent {
  final String contentType;
  final int lenght;

  LoadContentListEvent(this.contentType, this.lenght);
}

// États
abstract class ListState {
  final dynamic response;

  ListState(this.response);
}

class LoadingListState extends ListState {
  LoadingListState() : super(null);
}

class SuccessListState extends ListState {
  final dynamic content;

  SuccessListState(this.content) : super(null);
}

class ErrorListState extends ListState {
  final String message;

  ErrorListState(this.message) : super(null);
}

// Bloc
class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(LoadingListState()) {
    on<LoadContentListEvent>(_onLoadContentList);
  }

  Future<void> _onLoadContentList(
    LoadContentListEvent event,
    Emitter<ListState> emit,
  ) async {
    emit(LoadingListState());
    try {
      dynamic content;
      switch (event.contentType) {
        case 'serie':
          content = await ContentRequest().loadTvshowsList(event.lenght);
          break;
        case 'comics':
          content = await ContentRequest().loadComicsList(event.lenght);
          break;
        case 'films':
          content = await ContentRequest().loadMoviesList(event.lenght);
          break;
        default:
          throw 'Type de contenu non supporté';
      }
      emit(SuccessListState(content));
    } catch (e) {
      emit(ErrorListState(e.toString()));
    }
  }
}
