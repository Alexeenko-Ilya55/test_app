import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/common/app_language/domain/repositories/language_repository.dart';

@injectable
class GetLanguageUseCase {
  final LanguageRepository _languageRepository;

  GetLanguageUseCase(this._languageRepository);

  Locale execute() => _languageRepository.getLanguage();
}
