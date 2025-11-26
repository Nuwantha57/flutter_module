import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/user_model.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  void loadUserData(Map<String, dynamic> userData) {
    emit(const HomeState.loading());
    try {
      final user = UserModel.fromJson(userData);
      emit(HomeState.loaded(user));
    } catch (e) {
      emit(HomeState.error('Failed to load user data: ${e.toString()}'));
    }
  }

  void logout() {
    emit(const HomeState.initial());
  }
}
