import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

@RoutePage()
class InfoPage extends StatelessWidget {
  const InfoPage({super.key});


  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.authZone),
      ),
      body: Center(
        child: Text(localization.infoPageDescription),
      ),
    );
  }
}