import 'package:comic_vine/app/shared/models/comic_model.dart';
import 'package:comic_vine/app/shared/services/comics_services.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'comics_repository.g.dart';

@Injectable()
class ComicsRepository {
  final ComicsServices comicsServices;

  ComicsRepository(this.comicsServices);

  Future<List<Comic>> getAllComics() async {
    final comics = await comicsServices.getAllComics();
    return comics
        .map((comic) => Comic.fromJson(comic as Map<String, dynamic>))
        .toList();
  }
}
