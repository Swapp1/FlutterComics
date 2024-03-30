import 'package:comics_app/bloC/details_bloc.dart';
import 'package:comics_app/details/widgets/episodes.dart';
import 'package:comics_app/details/widgets/histoire.dart';
import 'package:comics_app/details/widgets/infos.dart';
import 'package:comics_app/details/widgets/personnages.dart';
import 'package:comics_app/widgets/lottieloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:comics_app/widgets/cardinfos.dart';


/// Page de details des différentes catégories, affiche la page generale (regroupe tout les widgets)
class Details extends StatelessWidget {
  final String contentType;
  final dynamic item;
  const Details({super.key, required this.contentType, required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsBloc>(
      create: (context) =>
          DetailsBloc()..add(LoadContentDetailsEvent(contentType, item.url)),
      child: Scaffold(
        body: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            if (state is LoadingDetailsState) {
              return const Center(child: Loader());
            } else if (state is SuccessDetailsState) {
              final content = state.content.results ?? [];
              return DefaultTabController(
                length: _getlength(),
                child: Scaffold(
                  body: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 400.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(content.image.originalUrl),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.1),
                              BlendMode.dstATop,
                            ),
                          ),
                        ),
                      ),
                      AppBar(
                        scrolledUnderElevation: 0.0,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        centerTitle: false,
                        title: Text(
                          content.name ?? 'no name found',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp,
                              color: Colors.white),
                        ),
                        leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.chevron_left_rounded,
                            color: Colors.white,
                            size: 35.sp,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 80.h),
                          SizedBox(
                              height: 180.h,
                              child: CardInfos(
                                details: true,
                                contentType: contentType,
                                item: content,
                              )),
                          TabBar(
                            splashFactory: NoSplash.splashFactory,
                            unselectedLabelColor: Colors.grey,
                            dividerColor: Colors.transparent,
                            indicatorColor: Colors.orange,
                            indicatorWeight: 4,
                            labelStyle: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                            tabs: _buildTabs(),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(20.w),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Color(0xff1E3243),
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              child: TabBarView(
                                children: _buildTabViews(content),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ErrorDetailsState) {
              return Center(child: Text('Erreur : ${state.message}'));
            } else {
              return const Center(child: Text('Aucun état'));
            }
          },
        ),
      ),
    );
  }

  List<Widget> _buildTabs() {
    switch (contentType) {
      case "films":
        return [
          const Tab(text: "Synopsis"),
          const Tab(text: "Personnages"),
          const Tab(text: "Infos"),
        ];
      case "serie":
        return [
          const Tab(text: "Histoire"),
          const Tab(text: "Personnages"),
          const Tab(text: "Épisodes"),
        ];
      case "comics":
        return [
          const Tab(text: "Histoire"),
          const Tab(text: "Auteurs"),
          const Tab(text: "Personnages"),
        ];
      case "personnage":
        return [
          const Tab(text: "Histoire"),
          const Tab(text: "Infos"),
        ];
      default:
        return [];
    }
  }

  int _getlength() {
    switch (contentType) {
      case "films":
        return 3;
      case "serie":
        return 3;
      case "comics":
        return 3;
      case "personnage":
        return 2;
      default:
        return 0;
    }
  }

  List<Widget> _buildTabViews(dynamic content) {
    switch (contentType) {
      case "films":
        return [
          Histoire(item: content),
          ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: content.characters.length,
            itemBuilder: (context, index) {
              final character = content.characters[index];
              return ListTile(
                title: PersonnagePreview(role: false, item: character),
              );
            },
          ),
          Infos(
            item: content,
            contentType: contentType,
          ),
        ];
      case "serie":
        return [
          Histoire(item: content),
          ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: content.characters.length,
            itemBuilder: (context, index) {
              final character = content.characters[index];
              return ListTile(
                title: PersonnagePreview(role: false, item: character),
              );
            },
          ),
          ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: content.episodes.length,
            itemBuilder: (context, index) {
              final episode = content.episodes[index];
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: EpisodePreview(item: episode),
              );
            },
          ),
        ];
      case "comics":
        return [
          Histoire(item: content),
          ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: content.characters.length,
            itemBuilder: (context, index) {
              final auteurs = content.writers[index];
              return ListTile(
                title: PersonnagePreview(role: true, item: auteurs),
              );
            },
          ),
          ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: content.characters.length,
            itemBuilder: (context, index) {
              final character = content.characters[index];
              return ListTile(
                title: PersonnagePreview(role: false, item: character),
              );
            },
          ),
        ];
      case "personnage":
        return [
          Histoire(item: content),
          Infos(
            item: content,
            contentType: contentType,
          ),
        ];
      default:
        return [const Text("Contenu non disponible")];
    }
  }
}
