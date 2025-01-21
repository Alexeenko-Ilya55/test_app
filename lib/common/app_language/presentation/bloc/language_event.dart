part of 'language_bloc.dart';


sealed class LanguageEvent {}

final class ChangeLanguage extends LanguageEvent {
  final Locale locale;

  ChangeLanguage(this.locale);
}
