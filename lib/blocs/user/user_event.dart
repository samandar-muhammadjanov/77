part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class GetUserDataEvent extends UserEvent {
  final BuildContext context;
  GetUserDataEvent(this.context);
}
