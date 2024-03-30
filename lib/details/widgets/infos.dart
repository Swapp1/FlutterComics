import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// Affichage du détail des informations
class Infos extends StatelessWidget {
  final dynamic item;
  final String contentType;

  const Infos({this.item, required this.contentType, super.key});

  Widget _buildRow(String title, dynamic value, {String nullText = "Inconnu"}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 8,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          Expanded(
            flex: 6,
            child: value is List<dynamic>
                ? _buildList(value)
                : Text(
                    value ?? nullText,
                    style: TextStyle(color: Colors.white, fontSize: 17.sp),
                    textAlign: TextAlign.left,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<dynamic> list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list
          .map((element) => Text(
                element.name ?? "Inconnu",
                style: TextStyle(color: Colors.white, fontSize: 17.sp),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (contentType == "films") ...[
          _buildRow("Classification", item.rating ?? "Rating non disponible"),
          _buildRow("Réalisateur", item.distributeur ?? "Inconnu"),
          _buildRow("Scénaristes", item.writers ?? []),
          _buildRow("Producteurs", item.producers ?? []),
          _buildRow("Studios", item.studios ?? []),
          _buildRow("Budget", formatNumber(item.budget)),
          _buildRow("Recettes au box office", formatNumber(item.boxoffice)),
          _buildRow("Recettes brutes totales", formatNumber(item.totalrevenue)),
        ] else if (contentType == "personnage") ...[
          _buildRow("Nom de super-héros", item.name ?? "Rating non disponible"),
          _buildRow("Nom réel", item.realname ?? "Inconnu"),
          _buildRow("Alias", item.aliases ?? "Inconnu"),
          _buildRow("Editeur", "Propriété du créateur"),
          _buildRow("Créateurs", item.creators ?? []),
          _buildRow("Genre", item.gender == 0 ? "Feminin" : "Masculin"),
          _buildRow("Date de naissance", item.birth ?? "Inconnu"),
          _buildRow("Décès", "N/A"),
        ]
      ],
    ));
  }

  String formatNumber(String numberString) {
    numberString = numberString.replaceAll(RegExp(r'\D'), '');

    int? number = int.tryParse(numberString);

    if (number == null) {
      return "Inconnu";
    } else if (number >= 1e9) {
      return (number % 1e9 == 0)
          ? '${(number / 1e9).floor()} milliards \$'
          : '${(number / 1e9).toStringAsFixed(1)} milliards \$';
    } else if (number >= 1e6) {
      return (number % 1e6 == 0)
          ? '${(number / 1e6).floor()} millions \$'
          : '${(number / 1e6).toStringAsFixed(1)} millions \$';
    } else if (number >= 1e3) {
      return (number % 1e3 == 0)
          ? '${(number / 1e3).floor()} mille \$'
          : '${(number / 1e3).toStringAsFixed(1)} mille \$';
    } else {
      return number.toString();
    }
  }
}
