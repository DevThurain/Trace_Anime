part of 'search_image_bloc.dart';

abstract class SearchImageEvent extends Equatable {
  const SearchImageEvent();

  @override
  List<Object> get props => [];
}

class EventMakeSearchImage extends SearchImageEvent {
  final File image;

  EventMakeSearchImage({required this.image});
  
    @override
  List<Object> get props => [image];
}
