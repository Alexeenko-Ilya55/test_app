import 'dart:io';
import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:test_app/common/app_language/domain/repositories/language_repository.dart';

@Singleton(as: LanguageRepository)
class LanguageRepositoryImpl implements LanguageRepository {
  Locale _locale = Locale(Platform.localeName);

  @override
  //here should be getting from sharedPreferences
  Locale getLanguage() => _locale;

  @override
  bool setLanguage(Locale locale) {
    //here should be saving in sharedPreferences
    _locale = locale;
    return true;
  }
}
