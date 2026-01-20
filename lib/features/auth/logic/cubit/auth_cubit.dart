import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/features/auth/models/data/model_body_auth.dart';
import 'package:ecommerce_app_food/features/auth/models/data/model_body_loginIn.dart';
import 'package:ecommerce_app_food/features/auth/models/data/model_body_profile.dart';
import 'package:ecommerce_app_food/features/auth/models/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AuthCubit(this.authRepo) : super(AuthInitial());

  Future<void> userRegister(ModelBodyAuth modelBodyAuth) async {
    try {
      emit(AuthLoading());

      await authRepo.register(modelBodyAuth);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthEror(message: e.toString()));
    }
  }

  Future<void> userLogin({
    required String phone,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      String? savedPhone = authRepo.sharedPreferences.getString(
        ConstantsApp.phoneKey,
      );
      LoginBodyModel model = LoginBodyModel(phone: phone, password: password);
      await authRepo.login(model);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginEror(message: e.toString()));
    }
  }

  // في ملف الـ States ضيف ProfileLoading, ProfileSuccess(user), ProfileError
  Future<void> getUserProfile() async {
    emit(ProfileLoading());
    try {
      final userModel = await authRepo.getDataInfo();
      emit(ProfileSuccess(model: userModel));
    } catch (e) {
      emit(ProfileEror(message: e.toString()));
    }
  }

  Future<void> logOut() async {
    await authRepo.logOut();
    emit(AuthInitial());
  }
}
