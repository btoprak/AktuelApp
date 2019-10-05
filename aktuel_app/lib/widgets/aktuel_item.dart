import 'package:aktuel_app/providers/aktuel.dart';
import 'package:aktuel_app/screens/aktuelDetails_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AktuelItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     final aktuel = Provider.of<Aktuel>(context, listen: false);
     String dateWithT =aktuel.releasedDate.substring(0, 10);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {Navigator.of(context).pushNamed(
              AktuelDetailsScreen.routeName,
              arguments: aktuel.aktuelId,
            );
          },
          child: Image.network(
            aktuel.aktuelImageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            dateWithT,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
