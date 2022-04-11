import 'dart:io';

import 'package:anime_tracker/models/search_results.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_image_event.dart';
part 'search_image_state.dart';

class SearchImageBloc extends Bloc<SearchImageEvent, SearchImageState> {
  SearchImageBloc() : super(SearchImageInitialState()) {
    on<SearchImageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
