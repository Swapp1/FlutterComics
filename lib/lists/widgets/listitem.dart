import 'package:comics_app/details/details.dart';
import 'package:comics_app/widgets/cardinfos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// Containers des informations de la liste => appelle cardinfos pour afficher les infos
class Listitem extends StatelessWidget {
  final dynamic item;
  final String contentType;
  final int? index;
  const Listitem(
      {super.key, this.item, required this.index, required this.contentType});

  @override
  Widget build(BuildContext context) {
    bool iscomic = contentType == "comics";
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Details(contentType: contentType, item: item)),
          );
        },
        child: Container(
            height: iscomic ? 200.h : 170.h,
            width: 500.w,
            decoration: BoxDecoration(
              color: const Color(0xFF1E3243),
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
            ),
            child: Stack(fit: StackFit.expand, children: [
              CardInfos(
                item: item,
                contentType: contentType,
                details: false,
              ),
              Positioned(
                  left: 5.w,
                  top: 5.h,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    decoration: const BoxDecoration(
                        color: Color(0XffFF8100),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      "#$index",
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                          color: Colors.white),
                    ),
                  )),
            ])));
  }
}
