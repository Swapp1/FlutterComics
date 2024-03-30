import 'dart:io';

import 'package:comics_app/acceuil/acceuil.dart';
import 'package:comics_app/lists/liste.dart';
import 'package:comics_app/search/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

/// Homepage avec bottomnavbar et l'affichage des pages
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool get wantKeepAlive => true;

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0F1E2B),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: BottomAppBar(
            height: 65.h,
            padding: EdgeInsets.only(top: 12.r),
            color: Colors.transparent,
            elevation: 0.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBottomNavigationItem(0),
                  _buildBottomNavigationItem(1),
                  _buildBottomNavigationItem(2),
                  _buildBottomNavigationItem(3),
                  _buildBottomNavigationItem(4),
                ],
              ),
            ),
          ),
        ),
        body: PageView.builder(
            onPageChanged: (int page) async {
              setState(() {
                currentIndex = page;
              });
              final can = await Haptics.canVibrate();
              if (can && Platform.isIOS) {
                await Haptics.vibrate(HapticsType.light);
              }
            },
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            itemCount: 5,
            itemBuilder: (_, i) {
              if (i == 0) {
                return Accueil(changeTab: (index) => _onItemTapped(index));
              } else if (i == 1) {
                return const Listeelements(contentType: "comics");
              } else if (i == 2) {
                return const Listeelements(contentType: "serie");
              } else if (i == 3) {
                return const Listeelements(contentType: "films");
              } else if (i == 4) {
                return SearchPage(changeTab: (index) => _onItemTapped(index));
              }
              return Container();
            }),
      ),
    ]);
  }

  Widget _buildBottomNavigationItem(int index) {
    bool isSelected = currentIndex == index;
    String assetName;
    String assetlabel = "";

    const activeColor = Colors.blue;
    const inactiveColor = Colors.grey;
    switch (index) {
      case 0:
        assetName = 'assets/svg/navbar_home.svg';
        assetlabel = "Acceuil";
        break;
      case 1:
        assetName = 'assets/svg/navbar_comics.svg';
        assetlabel = "Comics";
        break;
      case 2:
        assetName = 'assets/svg/navbar_series.svg';
        assetlabel = "Séries";
        break;
      case 3:
        assetName = "assets/svg/navbar_movies.svg";
        assetlabel = "Films";
        break;
      case 4:
        assetName = "assets/svg/navbar_search.svg";
        assetlabel = "Recherche";
        break;
      default:
        assetName = '';
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
          _pageController.jumpToPage(index);
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              assetName,
              height: 22.h,
              colorFilter: ColorFilter.mode(
                isSelected ? activeColor : inactiveColor,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              assetlabel,
              style: TextStyle(
                color: isSelected ? activeColor : inactiveColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
