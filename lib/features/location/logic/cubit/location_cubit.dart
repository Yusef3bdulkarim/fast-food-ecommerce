import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  Position? currentPosition;
  String currentAddress = "";
  bool isLoaded = false;
  bool isMoving = false;
  LocationCubit() : super(LocationInitial()) {
    loadSavedLocation();
  }

  Future<void> getUSerLocation() async {
    emit(LocationLoading());
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(LocationServiceDisabled());
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(LocationPermissionDenied());
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(LocationPermissionDenied());
        return;
      }

      currentPosition = await Geolocator.getCurrentPosition();

      await getAddressFromLatLng(currentPosition!);

      // 5. ابعت حالة النجاح ومعاها البيانات
      emit(LocationSuccess(currentAddress, currentPosition!));
    } catch (e) {
      // دائماً اطبع الخطأ عشان تعرف إيه اللي حصل أثناء التعلم
      print("Location Error: $e");
      emit(LocationInitial());
    }
  }

  Future<void> getAddressFromLatLng(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    Placemark place = placemarks[0];
    currentAddress = "${place.street}, ${place.locality}, ${place.country}";
  }

  Future<void> updateAddressFromMap(double lat, double lng) async {
    try {
      await setLocaleIdentifier("ar");

      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        currentAddress =
            "${place.street ?? ''}, ${place.subLocality ?? ''}, ${place.locality ?? ''}";

        currentPosition = Position(
          latitude: lat,
          longitude: lng,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0,
          altitudeAccuracy: 0,
          headingAccuracy: 0,
        );

        emit(LocationSuccess(currentAddress, currentPosition!));
      }
    } catch (e) {
      debugPrint("❌ Geocoding Error: $e");
    }
  }

  Future<void> saveFinalLocation(String address, Position position) async {
    try {
      final pref = await SharedPreferences.getInstance();
      await pref.setString(ConstantsApp.addressKey, address);
      await pref.setString(ConstantsApp.latKey, position.latitude.toString());
      await pref.setString(ConstantsApp.lngKey, position.longitude.toString());
      currentAddress = address;
      currentPosition = position;
      emit(LocationSuccess(address, position));
    } catch (e) {
      debugPrint("💕💕Error saving location: $e");
    }
  }

  Future<void> loadSavedLocation() async {
    try {
      final pref = await SharedPreferences.getInstance();

      final String? address = pref.getString(ConstantsApp.addressKey);
      final String? latStr = pref.getString(ConstantsApp.latKey);
      final String? lngStr = pref.getString(ConstantsApp.lngKey);

      if (address != null && latStr != null && lngStr != null) {
        currentAddress = address;
        currentPosition = Position(
          latitude: double.parse(latStr),
          longitude: double.parse(lngStr),
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0,
          altitudeAccuracy: 0,
          headingAccuracy: 0,
        );

        // أول ما نلاقي بيانات قديمة نبعت Success فوراً عشان البروفايل يظهر فيه العنوان
        emit(LocationSuccess(currentAddress, currentPosition!));
      }
      emit(LocationSuccess(currentAddress, currentPosition!));
    } catch (e) {
      debugPrint("❌ Error loading saved location: $e");
    }
  }

  Future<void> startLocationProcess() async {
    await loadSavedLocation();
    if (state is! LocationSuccess) {
      await getUSerLocation();
    }
  }

  void changeMovingState(bool moving) {
    isMoving = moving;
    // لازم نعمل emit عشان الـ BlocBuilder يحس بالتغيير ويعيد رسم الدبوس
    if (state is LocationSuccess) {
      final currentState = state as LocationSuccess;
      emit(
        LocationSuccess(currentState.address, currentState.currentPossition),
      );
    }
  }
}
