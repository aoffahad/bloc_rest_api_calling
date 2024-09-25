import 'package:bloc_rest_api_calling/cubit/user_cubit.dart';
import 'package:bloc_rest_api_calling/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/user_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserCubit>().getAllUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Cubit Rest API Call"),
      ),
      body: BlocBuilder<UserCubit, UserCubitState>(
        builder: (context, state) {
          if (state is UserCubitDataLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserCubitError) {
            return Center(
              child: Text(state.errorMessage.toString()),
            );
          } else if (state is UserCubitDataLoaded) {
            return ListView.builder(
              itemBuilder: (context, itemIndex) {
                UserModel userModel = state.userList[itemIndex];
                return ListTile(
                  leading: Text(userModel.id.toString()),
                  title: Text(userModel.name.toString()),
                  subtitle: Text(userModel.email.toString()),
                );
              },
              itemCount: state.userList.length,
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
