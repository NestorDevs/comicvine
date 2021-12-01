import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../config/styles/app_color.dart';
import '../../shared/cubit/comic_vine_cubit.dart';
import '../../shared/models/comic_model.dart';
import '../../shared/widgets/comic_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Comic> allComics;

  @override
  void initState() {
    context.read<ComicVineCubit>().getAllComics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.dark,
      appBar: AppBar(
        backgroundColor: AppColor.dark_100,
        title: _buildAppBarTitle(),
      ),
      body: buildBlocWidget(),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<ComicVineCubit, ComicVineState>(
      builder: (context, state) {
        if (state is ComicVineLoaded) {
          allComics = (state).comics;
          return buildLoadedListWidget(allComics);
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget buildLoadedListWidget(List<Comic> allComics) {
    return SingleChildScrollView(
      child: Container(
        color: AppColor.dark,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allComics.length,
      itemBuilder: (ctx, index) {
        return ComicItem(
          allComics[index],
        );
      },
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColor.white),
      ),
    );
  }

  Widget _buildAppBarTitle() {
    return const Text(
      'Comics',
      style: TextStyle(color: AppColor.white),
    );
  }

  /*
  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: AppColor.grey,
      decoration: const InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: AppColor.white, fontSize: 18),
      ),
      style: const TextStyle(color: AppColor.white, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedFOrItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
    searchedForCharacters = allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }



  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear, color: AppColor.white),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(
            Icons.search,
            color: AppColor.white,
          ),
        ),
      ];
    }
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }*/
}
