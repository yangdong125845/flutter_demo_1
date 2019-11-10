import 'package:flutter/material.dart';
import 'package:flutter_app_1/i10n/localization_intl.dart';

class InternationalizedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalizations.of(context).title),
      ),
      body: Container(),
    );
  }
}
