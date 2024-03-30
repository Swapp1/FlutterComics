import 'package:comics_app/bloC/list_bloc.dart';
import 'package:comics_app/lists/widgets/listitem.dart';
import 'package:comics_app/widgets/lottieloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


//Listes des éléments (comics, serie, films) => appel de listitem qui affiche chaque element puis les infos avec cardinfos
class Listeelements extends StatelessWidget {
  final String contentType;

  const Listeelements({super.key, required this.contentType});

  Widget _buildpage() {
    int lenght = 50;
    return BlocProvider<ListBloc>(
      create: (context) =>
          ListBloc()..add(LoadContentListEvent(contentType, lenght)),
      child: Scaffold(
        body: BlocBuilder<ListBloc, ListState>(
          builder: (context, state) {
            if (state is LoadingListState) {
              return const Center(child: Loader());
            } else if (state is SuccessListState) {
              final items = state.content.results ?? [];
              return ListView.builder(
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 20),
                      child: Listitem(
                        item: items[index],
                        index: index + 1,
                        contentType: contentType,
                      ));
                },
              );
            } else if (state is ErrorListState) {
              return Center(child: Text('Erreur : ${state.message}'));
            } else {
              return const Center(child: Text('Aucun état'));
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(20, 60, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.w, bottom: 20.h),
            child: Text(
              getTitleForContentType(contentType),
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(child: _buildpage()),
        ],
      ),
    ));
  }

  String getTitleForContentType(String contentType) {
    switch (contentType) {
      case 'comics':
        return "Comics les plus populaires";
      case 'serie':
        return "Series les plus populaires";
      case 'films':
        return "Films les plus populaires";
      default:
        return "Contenu populaire";
    }
  }
}
