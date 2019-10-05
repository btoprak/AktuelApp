
import 'package:aktuel_app/providers/aktuels.dart';
import 'package:aktuel_app/widgets/aktuel_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AktuelsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final aktuelsData = Provider.of<Aktuels>(context);
    final aktuels = aktuelsData.items;
    

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: aktuels.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (c)=>products[i],
        value: aktuels[i],
        child: AktuelItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
