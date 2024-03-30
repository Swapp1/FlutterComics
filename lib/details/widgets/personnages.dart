import 'package:comics_app/bloC/details_bloc.dart';
import 'package:comics_app/details/details.dart';
import 'package:comics_app/widgets/lottieloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


///Affichage des personnages
class PersonnagePreview extends StatelessWidget {
  final dynamic item;
  final bool role;

  const PersonnagePreview({this.item, required this.role, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsBloc>(
      create: (context) =>
          DetailsBloc()..add(LoadContentDetailsEvent("personnage", item.url)),
      child: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          if (state is LoadingDetailsState) {
            return const Center(child: Loader());
          } else if (state is SuccessDetailsState) {
            final characters = state.content.results ?? [];
            return GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.network(
                        characters.image.originalUrl,
                        width: 45.r,
                        height: 45.r,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    if (!role)
                      Text(
                        characters.name ?? "no name found",
                        style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    if (role)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            characters.name ?? "no name found",
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            item.role ?? "no role found",
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      )
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Details(contentType: "personnage", item: item)),
                  );
                });
          } else if (state is ErrorDetailsState) {
            print(state.message);
            return Center(
                child: Text(
              'Erreur : ${state.message}',
              style: const TextStyle(color: Colors.white),
            ));
          } else {
            return const Center(child: Text('Aucun état'));
          }
        },
      ),
    );
  }
}
