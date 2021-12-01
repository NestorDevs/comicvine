import 'package:comic_vine/app/modules/comic_detail/comic_detail_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ComicDetailModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const ComicDetailPage()),
  ];
}
