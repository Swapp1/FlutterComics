import 'package:comics_app/API/api_request.dart';
import 'package:comics_app/widgets/lottieloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// Affichage des épisodes
class EpisodePreview extends StatelessWidget {
  final dynamic item;

  const EpisodePreview({this.item, super.key});

  String formateDate(String? dateString) {
    if (dateString == null) {
      return "Date introuvable";
    }

    try {
      DateTime date = DateTime.parse(dateString);
      String formattedDate = DateFormat("d MMMM yyyy", "fr_FR").format(date);
      return formattedDate;
    } catch (e) {
      return "Date introuvable";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF284C6A),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: FutureBuilder<dynamic>(
        future: DetailsRequest(item.url).loadEpisode(1),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: Loader());
          } else if (snapshot.hasError) {
            return Text('Une erreur est survenue ! :${snapshot.error}');
          } else {
            final episode = snapshot.data?.results ?? [];
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      episode.image.originalUrl,
                      width: 125.w,
                      height: 110.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.h),
                    Text(
                      "Episode #${episode.number}",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      episode.name ?? "no name found",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                              Color(0Xff69727D), BlendMode.srcIn),
                          child: SvgPicture.asset(
                            "assets/svg/ic_calendar_bicolor.svg",
                            height: 13.h,
                          ),
                        ),
                        SizedBox(width: 7.w),
                        Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: Text(
                            formateDate(episode.date.toString()),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                  ],
                )
              ],
            );
          }
        },
      ),
    );
  }
}
