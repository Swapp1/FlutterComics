import 'package:comics_app/acceuil/widgets/slider_content.dart';
import 'package:comics_app/details/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';


///Affichage du slider de chaque catégorie
class Itemsslider extends StatelessWidget {
  final String type;
  final VoidCallback? onPressed;
  final dynamic item;
  final bool issearch;

  const Itemsslider({
    super.key,
    required this.type,
    this.onPressed,
    required this.item,
    required this.issearch,
  });

  Widget _buildview() {
    if (item.isEmpty) {
      return Container(
          height: 200.h,
          width: 300.w,
          child: Center(
            child: Text(
              "Pas de résultat :(",
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ));
    } else {
      return Expanded(
        child: ListView.builder(
          padding: EdgeInsets.fromLTRB(17.w, 0, 0, 20.h),
          scrollDirection: Axis.horizontal,
          itemCount: item.length,
          itemBuilder: (BuildContext context, int index) {
            if (type == "actu") {
              return Container(
                height: 200.h,
                width: 300.w,
                padding: EdgeInsets.only(right: 20.w),
                child: SliderContent(
                  item: item[index],
                  onTap: () async {
                    String url = item[index].url;
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              );
            } else {
              return Container(
                height: 242.h,
                width: 180.w,
                padding: EdgeInsets.only(right: 10.w),
                child: SliderContent(
                  item: item[index],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Details(contentType: type, item: item[index]),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      );
    }
  }

  String getText() {
    String title;

    switch (type) {
      case "serie":
        title = "Séries Populaires";
        return title;
      case "comics":
        title = "Comics Populaires";
        return title;
      case "films":
        title = "Films Populaires";
        return title;
      case "actu":
        title = "Actualités";
        return title;
      case "personnage":
        title = "Personnages";
        return title;
      default:
        title = "Oops, aucun des types habituels";
        return title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      decoration: BoxDecoration(
        color: const Color(0xFF1E3243),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          bottomLeft: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(17.w, 18.h, 10.w, 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10.w,
                      height: 10.h,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF8100),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 9.w),
                    Text(
                      getText(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
                if (!(issearch || type == "actu"))
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 18.w, vertical: 7.h),
                      backgroundColor: const Color(0xFF15232E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Voir plus',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
              ],
            ),
          ),
          _buildview(),
        ],
      ),
    );
  }
}
