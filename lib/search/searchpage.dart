import 'package:comics_app/acceuil/widgets/slider.dart';
import 'package:comics_app/bloC/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


/// Page de recherche
class SearchPage extends StatelessWidget {
  final Function(int) changeTab;

  const SearchPage({super.key, required this.changeTab});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SearchBloc(),
        child: Scaffold(
          body: Column(children: [
            Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                padding: EdgeInsets.only(
                    left: 35.w, top: 50.h, bottom: 20.h, right: 20.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF223141),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35.r),
                    bottomRight: Radius.circular(35.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recherche",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Builder(builder: (context) {
                      return TextField(
                        onSubmitted: (value) {
                          BlocProvider.of<SearchBloc>(context)
                              .add(SearchSubmitted(value));
                        },
                        style: const TextStyle(
                            color: Colors.white, fontSize: 17.0),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(17.w, 14.h, 10.w, 14.h),
                          filled: true,
                          fillColor: const Color(0xFF15232E),
                          hintText: "Comic, film, série...",
                          hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 17.0),
                          suffixIcon: Padding(
                            padding: EdgeInsetsDirectional.only(end: 20.w),
                            child: const Icon(
                              Icons.search,
                              size: 30,
                              color: Color(0xFF728CAB),
                              weight: 10,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      );
                    })
                  ],
                )),
            Expanded(child: Builder(builder: (context) {
              return BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitialState) {
                    return Column(
                      children: [
                        const Spacer(),
                        Center(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      EdgeInsets.fromLTRB(23.w, 0, 125.w, 0),
                                  height: 150,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF223141),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.r),
                                    ),
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: const Color(0xFF1F9FFF),
                                        fontSize: 15.sp,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text:
                                                'Saisissez une recherche pour trouver un '),
                                        TextSpan(
                                          text: 'comics',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(text: ', '),
                                        TextSpan(
                                          text: 'film',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(text: ', '),
                                        TextSpan(
                                          text: 'série ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(text: 'ou '),
                                        TextSpan(
                                          text: 'personnage',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(text: '.'),
                                      ],
                                    ),
                                  )),
                              Positioned(
                                right: 30.w,
                                top: -30.h,
                                child: SvgPicture.asset(
                                    "assets/svg/astronaut.svg",
                                    height: 100.h),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    );
                  } else if (state is LoadingSearchState) {
                    return Column(
                      children: [
                        const Spacer(),
                        SizedBox(
                          height: 50.h,
                        ),
                        Center(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                alignment: Alignment.bottomCenter,
                                padding: EdgeInsets.only(bottom: 25.h),
                                height: 150,
                                width: 400,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF223141),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.r),
                                  ),
                                ),
                                child: Text(
                                  "Recherche en cours,\nMerci de patienter...",
                                  style: TextStyle(
                                    color: const Color(0xFF1F9FFF),
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: -140.h,
                                child: SvgPicture.asset(
                                    "assets/svg/astronaut.svg",
                                    height: 190.h),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    );
                  } else if (state is SuccessSearchState) {
                    List<String> contentTypes = [
                      'films',
                      'serie',
                      'comics',
                      'personnage'
                    ];
                    return SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(20, 30, 0, 20),
                        child: Column(
                          children: contentTypes.map((contentType) {
                            var items =
                                state.contentByType[contentType]?.results ?? [];
                                
                            return Container(
                              height: 320.h,
                              padding: EdgeInsets.only(bottom: 20.w),
                              child: Itemsslider(
                                type: contentType,
                                item: items,
                                issearch: true,
                              ),
                            );
                          }).toList(),
                        ));
                  } else if (state is ErrorSearchState) {
                    return Text('Une erreur est survenue : ${state.message}');
                  } else {
                    return const Text('État inconnu');
                  }
                },
              );
            }))
          ]),
        ));
  }
}
