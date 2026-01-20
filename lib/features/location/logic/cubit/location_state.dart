part of 'location_cubit.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

// ignore: must_be_immutable
final class LocationSuccess extends LocationState {
  final String address;
  final Position currentPossition;
  final DateTime dateTime;
  LocationSuccess(this.address, this.currentPossition)
    : dateTime = DateTime.now();
  @override
  List<Object> get props => [address, currentPossition, dateTime];
}

final class LocationPermissionDenied extends LocationState {}

final class LocationServiceDisabled extends LocationState {}
