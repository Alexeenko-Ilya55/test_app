import 'package:flutter/material.dart';

abstract class LanguageRepository {

  bool setLanguage(Locale locale);

  Locale getLanguage();
}
