import 'package:aktuel_app/providers/company.dart';
import 'package:aktuel_app/screens/aktuels_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyItem extends StatelessWidget {
//  final String id;
//   final String companyName;
//   final String companyId;
//   final String aktuelImageUrl;

//   CompanyItem(this.id,this.companyName,this.companyId,this.aktuelImageUrl);

  @override
  Widget build(BuildContext context) {
    final company = Provider.of<Company>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AktuelsScreen.routeName,
              arguments: {
                'companyId':'${company.companyId}',
                'companyName':'${company.companyName}',
              },
            );
          },
          child: Image.network(
            company.aktuelImageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            company.companyName,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
