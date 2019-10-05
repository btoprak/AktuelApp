import 'package:aktuel_app/providers/companies.dart';
import 'package:aktuel_app/widgets/app_drawer.dart';
import 'package:aktuel_app/widgets/companies_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompaniesScreen extends StatefulWidget {
  @override
  _CompaniesScreenState createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    //Provider.of<Products>(context).fetchAndSetProducts();  //WON'T WORK
    // Future.delayed(Duration.zero).then((_){
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Companies>(context).getCompanies().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _refreshCompanies(BuildContext context) async {
    await Provider.of<Companies>(context, listen: false).getCompanies(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marketler"),
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () => _refreshCompanies(context),
              child: CompaniesGrid(),
            ),
    );
  }
}
