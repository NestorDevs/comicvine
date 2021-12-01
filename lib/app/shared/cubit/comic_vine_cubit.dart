import 'package:bloc/bloc.dart';
import 'package:comic_vine/app/shared/repository/comics_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta/meta.dart';

import '../models/comic_model.dart';

part 'comic_vine_state.dart';

part 'comic_vine_cubit.g.dart';

@Injectable(singleton: false)
class ComicVineCubit extends Cubit<ComicVineState> {
  final ComicsRepository repository;
  List<Comic> listComics = [];
  ComicVineCubit(this.repository) : super(ComicVineInitial());

  List<Comic> getAllComics() {
    repository.getAllComics().then((value) {
      emit(ComicVineLoaded(value));
      listComics = value;
    });

    return listComics;
  }
}
