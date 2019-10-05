
import 'package:aktuel_app/providers/companies.dart';
import 'package:aktuel_app/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompaniesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final companiesData = Provider.of<Companies>(context);
    final companies = companiesData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: companies.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (c)=>products[i],
        value: companies[i],
        child: CompanyItem(
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
