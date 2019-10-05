
import 'package:aktuel_app/providers/aktuelDetails.dart';
import 'package:aktuel_app/widgets/aktuelDetail_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AktuelDetailsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final aktuelDetailsData = Provider.of<AktuelDetails>(context);
    final aktuelDetails = aktuelDetailsData.items;
    

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: aktuelDetails.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (c)=>products[i],
        value: aktuelDetails[i],
        child: AktuelDetailItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 4 / 6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
