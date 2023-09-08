part of 'language_bloc.dart';

class LanguageEvent {}

class ChangeLanguageEvent extends LanguageEvent {
  final Locale locale;
  ChangeLanguageEvent(this.locale);
}
