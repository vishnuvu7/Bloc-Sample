import 'package:bloc_sample/di/di.dart';
import 'package:bloc_sample/features/auth/cubit/login_cubit.dart';
import 'package:bloc_sample/features/auth/model/request/auth_request.dart';
import 'package:bloc_sample/features/auth/model/response/auth_response.dart';
import 'package:bloc_sample/service/api_state.dart';
import 'package:bloc_sample/utils/common_utils/theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameCtrl = TextEditingController(text: 'admin');
    final passwordCtrl = TextEditingController(text: 'password123');
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Login",
          ),
          actions: [
            IconButton(
                onPressed: () {
                  final themeCubit = context.read<AppThemeCubit>();
                  themeCubit.changeTheme();
                },
                icon: const Icon(
                  Icons.dark_mode,
                )),
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: 250,
                child: TextField(
                  controller: usernameCtrl,
                  decoration: InputDecoration(
                      label: const Text("Username"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                width: 250,
                child: TextField(
                  controller: passwordCtrl,
                  decoration: InputDecoration(
                      label: const Text("Password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
              ),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * .3,
                child: BlocProvider<LoginCubit>(
                  create: (context) => locate<LoginCubit>(),
                  child: BlocListener<LoginCubit, APIState>(
                    listener: (context, state) {
                      switch(state.runtimeType){
                        case APILoading:
                          EasyLoading.show();
                          break;
                        case APILoaded<AuthResponse>:
                          EasyLoading.dismiss();
                          final response = (state as APILoaded<AuthResponse>).data;
                          ///Check Condition [response] is valid or not and navigate to home page
                          context.goNamed('animePage');
                          break;
                        case APIStateFailure:
                          EasyLoading.dismiss();
                          break;
                        default:
                          EasyLoading.dismiss();
                          break;
                      }
                    },
                    child: Builder(
                      builder: (context) {
                        return ElevatedButton(
                            onPressed: () {
                              final loginBloc = context.read<LoginCubit>();
                              if(usernameCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty){
                                AuthRequest request = AuthRequest(username: usernameCtrl.text, password: passwordCtrl.text);
                                loginBloc.login(request);
                              }else{
                                print("please enter username & password");
                              }
                            },
                            child: const Text("Login"));
                      }
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
