import 'package:comic_vine/app/config/styles/app_color.dart';
import 'package:comic_vine/app/shared/models/comic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ComicItem extends StatelessWidget {
  final Comic comic;

  // ignore: use_key_in_widget_constructors
  const ComicItem(this.comic);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
      decoration: BoxDecoration(
        color: AppColor.dark,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Modular.to.pushNamed('/details', arguments: comic),
        child: GridTile(
          child: Hero(
            tag: comic.results!.id ?? '',
            child: Container(
              color: AppColor.dark_100,
              child: comic.results!.imageUrl == null
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'assets/loading.gif',
                      image: comic.results!.imageUrl!.smallUrl ?? '',
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/placeholder.jpg'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black45,
            alignment: Alignment.bottomCenter,
            child: Text(
              comic.results!.name ?? '',
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: AppColor.white,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
