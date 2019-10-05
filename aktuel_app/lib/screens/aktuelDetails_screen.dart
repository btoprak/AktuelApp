import 'package:aktuel_app/providers/aktuelDetails.dart';
import 'package:aktuel_app/widgets/aktuelDetails_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AktuelDetailsScreen extends StatefulWidget {
  static const routeName = '/aktuel-detail';

  @override
  _AktuelDetailsScreenState createState() => _AktuelDetailsScreenState();
}

class _AktuelDetailsScreenState extends State<AktuelDetailsScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    //....
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      final aktuelId = ModalRoute.of(context).settings.arguments as int;
      Provider.of<AktuelDetails>(context)
          .getAktuelDetailsById(aktuelId)
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
    final aktuelId = ModalRoute.of(context).settings.arguments as int;
    

    return Scaffold(
      appBar: AppBar(
        title: Text("$aktuelId"),
      ),
      //drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : AktuelDetailsGrid(),
    );
  }
}
