import 'dart:io';

import 'package:anime_tracker/models/app_error.dart';
import 'package:anime_tracker/models/search_results.dart';
import 'package:anime_tracker/network/repository/tracer_repository_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_image_event.dart';
part 'search_image_state.dart';

class SearchImageBloc extends Bloc<SearchImageEvent, SearchImageState> {
  var repositoryImpl = TracerRepositoryImpl();
  SearchImageBloc() : super(SearchImageInitialState()) {
    on<EventMakeSearchImage>((event, emit) async {
      emit(SearchImageLoadingState());

      var response = await repositoryImpl.searchWithImage(event.image);

      emit(response.fold((l) {
        print(l.message);
        return SearchImageErroreState(appError: l);
      }, (r) {
        print(r.toString());
        return SearchImageCompleteState(result: r);
      }));
    });
  }
}
