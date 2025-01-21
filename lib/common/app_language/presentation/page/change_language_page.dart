import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:test_app/core/app/bloc/app_bloc.dart';
import 'package:test_app/core/theme/common_size.dart';

@RoutePage()
class ChangeLanguagePage extends StatelessWidget {
  const ChangeLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.changeLanguage),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CommonSize.medium,
            ),
            child: Text(localization.selectLanguage),
          ),
          const SizedBox(height: CommonSize.medium),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: Localization.supportedLocales.map((locale) {
              return ListTile(
                title: Text(
                  locale.languageCode,
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  BlocProvider.of<AppBloc>(context).add(
                    ChangeLanguage(locale),
                  );
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}