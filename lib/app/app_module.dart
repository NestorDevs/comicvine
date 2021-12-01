import 'package:flutter_modular/flutter_modular.dart';

import 'modules/comic_detail/comic_detail_module.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_page.dart';
import 'shared/cubit/comic_vine_cubit.dart';
import 'shared/repository/comics_repository.dart';
import 'shared/services/comics_services.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    $ComicVineCubit,
    $ComicsRepository,
    $ComicsServices
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const SplashPage()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/details', module: ComicDetailModule()),
  ];
}
