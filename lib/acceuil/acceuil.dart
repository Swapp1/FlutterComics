import 'package:comics_app/acceuil/widgets/slider.dart';
import 'package:comics_app/bloC/preview_bloc.dart';
import 'package:comics_app/widgets/lottieloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

///Page acceuil avec appel au slider pour chaque catégorie
class Accueil extends StatelessWidget {
  final Function(int) changeTab;
  const Accueil({super.key, required this.changeTab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          right: 10.w,
          top: 50.h,
          child: SvgPicture.asset("assets/svg/astronaut.svg", height: 150.h),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 50, 0, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 35.h),
                child: Text(
                  "Bienvenue !",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              BlocProvider(
                create: (_) => PreviewBloc()..add(LoadAllContentPreviewEvent()),
                child: Builder(
                  builder: (context) {
                    return BlocBuilder<PreviewBloc, PreviewState>(
                      builder: (context, state) {
                        if (state is LoadingPreviewState) {
                          return Column(
                            children: [
                              SizedBox(height: 150.h),
                              const Center(
                                child: Loader(),
                              )
                            ],
                          );
                        } else if (state is SuccessPreviewState) {
                          List<String> contentTypes = [
                            'films',
                            'serie',
                            'comics',
                            'actu'
                          ];
                          Map<String, int> tabIndexes = {
                            'films': 3,
                            'serie': 2,
                            'comics': 1,
                            'actu': 1,
                          };

                          return Column(
                            children: contentTypes.map((contentType) {
                              var items =
                                  state.contentByType[contentType]?.results ??
                                      [];
                              return Container(
                                height: 320.h,
                                padding: EdgeInsets.only(bottom: 20.w),
                                child: Itemsslider(
                                  type: contentType,
                                  item: items,
                                  onPressed: () =>
                                      changeTab(tabIndexes[contentType] ?? 0),
                                  issearch: false,
                                ),
                              );
                            }).toList(),
                          );
                        } else if (state is ErrorPreviewState) {
                          return Text(
                              'Une erreur est survenue : ${state.exception}');
                        } else {
                          return const Text('État inconnu');
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
