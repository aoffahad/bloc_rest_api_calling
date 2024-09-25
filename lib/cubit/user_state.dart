import 'package:equatable/equatable.dart';

import '../model/user_model.dart';

abstract class UserCubitState extends Equatable {
  const UserCubitState();
}

class UserCubitInit extends UserCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserCubitDataLoading extends UserCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserCubitDataLoaded extends UserCubitState {
  List<UserModel> userList;
  UserCubitDataLoaded({required this.userList});

  @override
  // TODO: implement props
  List<Object?> get props => [userList];
}

class UserCubitError extends UserCubitState {
  String errorMessage;
  UserCubitError({required this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}
