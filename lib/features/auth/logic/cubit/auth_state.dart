part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {}

final class AuthEror extends AuthState {
  final String message;

  AuthEror({required this.message});
}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginEror extends AuthState {
  final String message;
  LoginEror({required this.message});
}

final class ProfileLoading extends AuthState {}

final class ProfileSuccess extends AuthState {
  final ModelBodyProfile model;
  final String? localImagePath;

  ProfileSuccess({this.localImagePath, required this.model});
  @override
  List<Object> get props => [model, localImagePath ?? ""];
}

final class ProfileEror extends AuthState {
  final String message;
  ProfileEror({required this.message});
}
