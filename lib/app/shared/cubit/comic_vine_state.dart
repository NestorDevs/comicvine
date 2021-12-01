part of 'comic_vine_cubit.dart';

@immutable
abstract class ComicVineState {}

class ComicVineInitial extends ComicVineState {}

class ComicVineLoaded extends ComicVineState {
  final List<Comic> comics;
  ComicVineLoaded(this.comics);
}
