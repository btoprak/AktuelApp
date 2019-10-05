
import 'package:aktuel_app/providers/aktuelDetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AktuelDetailItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     final aktuelDetail = Provider.of<AktuelDetail>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
          },
          child: Image.network(
            aktuelDetail.pageImageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
