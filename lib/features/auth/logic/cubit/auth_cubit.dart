import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/features/auth/models/data/model_body_auth.dart';
import 'package:ecommerce_app_food/features/auth/models/data/model_body_loginIn.dart';
import 'package:ecommerce_app_food/features/auth/models/data/model_body_profile.dart';
import 'package:ecommerce_app_food/features/auth/models/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

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
      LoginBodyModel model = LoginBodyModel(phone: phone, password: password);

      // بنستنى النتيجة من الـ Repo
      bool isSuccess = await authRepo.login(model);

      if (isSuccess) {
        emit(LoginSuccess());
      } else {
        emit(LoginEror(message: "Invalid phone or password"));
      }
    } catch (e) {
      emit(LoginEror(message: e.toString()));
    }
  }

  // في ملف الـ States ضيف ProfileLoading, ProfileSuccess(user), ProfileError
  Future<void> getUserProfile() async {
    emit(ProfileLoading());
    try {
      final userModel = await authRepo.getDataInfo();
      String? savedPath = authRepo.sharedPreferences.getString(
        'user_image_path',
      );
      emit(ProfileSuccess(model: userModel, localImagePath: savedPath));
    } catch (e) {
      emit(ProfileEror(message: e.toString()));
    }
  }

  Future<void> logOut() async {
    await authRepo.logOut();
    emit(AuthInitial());
  }

  final ImagePicker _picker = ImagePicker();
  // جوه كلاس AuthCubit
  bool _isPickerActive = false; // متغير لحماية الميثود

  Future<void> pickAndSaveImage() async {
    if (_isPickerActive) return;

    _isPickerActive = true;

    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );

      if (image != null) {
        await authRepo.sharedPreferences.setString(
          ConstantsApp.imageKey,
          image.path,
        );

        if (state is ProfileSuccess) {
          final currentState = state as ProfileSuccess;
          emit(
            ProfileSuccess(
              model: currentState.model,
              localImagePath: image.path,
            ),
          );
        }
      }
    } catch (e) {
      print("Error picking image: $e");
    } finally {
      _isPickerActive = false; // فك الحماية سواء نجحت أو فشلت
    }
  }
}
