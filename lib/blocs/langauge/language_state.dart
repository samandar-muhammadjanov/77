part of 'language_bloc.dart';

class LanguageState {}

final class LanguageInitial extends LanguageState {}

final class LanguageLoaded extends LanguageState {
  final Locale locale;
  LanguageLoaded(this.locale);
}
