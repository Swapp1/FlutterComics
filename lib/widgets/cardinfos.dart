import 'package:comics_app/details/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';


/// Affichage des informations dans les cards ( liste ou details en haut)
class CardInfos extends StatelessWidget {
  final String contentType;
  final dynamic item;
  final bool details;
  const CardInfos(
      {super.key, this.item, required this.contentType, required this.details});

String formatYearOnly(String? date) {
  if (date == null) {
    return "no information";
  }
  final DateTime parsedDate = DateTime.parse(date);
  final DateFormat formatter = DateFormat('yyyy');
  return formatter.format(parsedDate);
}

String formatMonthYear(String? date) {
  if (date == null) {
    return "no information";
  }
  final DateTime parsedDate = DateTime.parse(date);
  final DateFormat formatter = DateFormat("MMMM yyyy", "fr_FR");
  return formatter.format(parsedDate);
}


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (!details) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Details(contentType: contentType, item: item)),
            );
          }
        },
        child: Padding(
            padding: EdgeInsets.fromLTRB(11.w, 22.h, 20.w, 17.h),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, 
              children: [
                if (contentType != "comics" && !details)
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    child: Image.network(
                      item.image.originalUrl,
                      width: 130.w,
                      height: 130.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (contentType == "comics" || details)
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    child: Image.network(
                      item.image.originalUrl,
                      width: 120.w,
                      height: 160.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!details) ...[
                        Text(
                          item.name ?? "No name",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                      if (contentType == "comics") ...[
                        SizedBox(height: 10.h),
                        Text(
                          item.volume.volumeName ?? "No volume name",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (contentType == "films") ...[
                              contentrows(
                                item.runtime + " minutes" ?? "No runtime",
                                "assets/svg/ic_movie_bicolor.svg",
                                details),

                              contentrows(formatYearOnly(item.date.toString()),
                                "assets/svg/ic_calendar_bicolor.svg", details),

                          ] else if (contentType == "serie") ...[
                            if (item.publisher != null)
                              contentrows(
                                  item.publisher.name ?? "No publisher",
                                  "assets/svg/ic_publisher_bicolor.svg",
                                  details),
                              contentrows("${item.nbepisodes} épisodes",
                                "assets/svg/ic_tv_bicolor.svg", details),
                              contentrows(item.date ?? "no date available",
                                "assets/svg/ic_calendar_bicolor.svg", details),
                          ] else if (contentType == "comics") ...[
                              contentrows("N°${item.number}",
                                "assets/svg/ic_books_bicolor.svg", details),
                              contentrows(formatMonthYear(item.date.toString()),
                                "assets/svg/ic_calendar_bicolor.svg", details),
                          ],
                        ],
                      ),
                      if (details && contentType != "comics") const Spacer(),
                    ],
                  ),
                )
              ],
            )));
  }
}

Widget contentrows(String title, String svglink, bool details) {
  return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!details)
            ColorFiltered(
              colorFilter:
                  const ColorFilter.mode(Color(0Xff69727D), BlendMode.srcIn),
              child: SvgPicture.asset(
                svglink,
                width: 15.h,
              ),
            ),
          if (details)
            ColorFiltered(
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              child: SvgPicture.asset(
                svglink,
                width: 15.h,
              ),
            ),
          SizedBox(width: 7.w),
          if (!details)
            Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
          if (details)
            Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
        ],
      ));
}
