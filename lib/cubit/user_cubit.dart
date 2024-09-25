import 'package:bloc/bloc.dart';
import 'package:bloc_rest_api_calling/cubit/user_state.dart';

import '../model/user_model.dart';
import '../service/api_service.dart';

class UserCubit extends Cubit<UserCubitState> {
  List<UserModel> userList = [];
  ApiService apiService;
  UserCubit({required this.apiService}) : super(UserCubitInit());

  void getAllUserList() async {
    try {
      emit(UserCubitDataLoading());
      userList = await apiService.getData();
      emit(UserCubitDataLoaded(
        userList: userList,
      ));
    } catch (e) {
      emit(UserCubitError(errorMessage: e.toString()));
    }
  }
}
