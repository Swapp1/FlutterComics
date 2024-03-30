import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart'; 


/// Affichage de la description
class Histoire extends StatelessWidget {
  final dynamic item;
  const Histoire({this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Html(
        data: item.description ?? "oops, aucune description fournie",
        style: {
          'body': Style(
              fontSize: FontSize(17.0.sp),
              color: Colors.white,
              fontWeight: FontWeight.w600),
        },
      ),
    );
  }
}
