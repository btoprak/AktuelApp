import 'package:aktuel_app/providers/aktuels.dart';
import 'package:aktuel_app/widgets/aktuels_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AktuelsScreen extends StatefulWidget {
  static const routeName = '/company-aktuel';

  @override
  _AktuelsScreenState createState() => _AktuelsScreenState();
}

class _AktuelsScreenState extends State<AktuelsScreen> {
  var _isInit = true;
  var _isLoading = false;
  String companyName;

  @override
  void initState() {
    //....
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   if (!_loadedInitData) {
  //     final routeArgs =
  //         ModalRoute.of(context).settings.arguments as Map<String, String>;
  //     categoryTitle = routeArgs["title"];
  //     final categoryId = routeArgs["id"];
  //     displayedMeals = widget.availableMeals.where((meal) {
  //       return meal.categories.contains(categoryId);
  //     }).toList();
  //     _loadedInitData = true;
  //   }
  //   super.didChangeDependencies();
  // }

  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Provider.of<Aktuels>(context).fetchAndSetProducts().then((_) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     });
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      final args =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      String companyId = args["companyId"];
      companyName = args["companyName"];

      Provider.of<Aktuels>(context)
          .getAktuelsById(int.parse(companyId))
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // is the id!

    return Scaffold(
      appBar: AppBar(
        title: Text(companyName),
      ),
      //drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : AktuelsGrid(),
    );
  }
}
