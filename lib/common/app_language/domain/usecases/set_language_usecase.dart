import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/common/app_language/domain/repositories/language_repository.dart';

@injectable
class SetLanguageUseCase {
  final LanguageRepository _languageRepository;

  SetLanguageUseCase(this._languageRepository);

  bool execute(Locale locale) => _languageRepository.setLanguage(locale);
}
