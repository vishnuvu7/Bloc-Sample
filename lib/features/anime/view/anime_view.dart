import 'package:bloc_sample/di/di.dart';
import 'package:bloc_sample/features/anime/cubit/anime_cubit.dart';
import 'package:bloc_sample/features/anime/model/response/anime_response.dart';
import 'package:bloc_sample/service/api_state.dart';
import 'package:bloc_sample/utils/common_utils/theme/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnimeCubit>(
      create: (context) => locate<AnimeCubit>(),
      child: Builder(
        builder: (context) {
          final AnimeCubit bloc = context.read<AnimeCubit>();
          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Bloc Sample app",
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        context.pushNamed('addAnime');
                      },
                      icon: const Icon(
                        Icons.add,
                      )),
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
              floatingActionButton: FloatingActionButton(onPressed: () {
                bloc.refreshApi();
              }, child: const Icon(Icons.refresh)),
              body: BlocBuilder<AnimeCubit, APIState>(
                //Bloc builder is same as Obx wrapped widget will change when data changes
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case APILoaded<List<AnimeListResponse>>:
                      List<AnimeListResponse> animeList = (state as APILoaded).data;
                      return ListView.builder(
                        itemBuilder: (context, index) =>
                            ListTile(
                              onTap: () {},
                              title: Text(animeList[index].anime),
                              leading: CircleAvatar(child: Text(animeList[index].anime.substring(0, 1).toString())),
                            ),
                        itemCount: animeList.length,

                      );
                    case APILoading:
                      return const Center(child: CircularProgressIndicator());
                    case APIStateFailure:
                      final errorMessage = (state as APIStateFailure).message;
                      return  Center(child: Text(errorMessage));
                    default:
                      return const Center(child: Text("Error"));
                  }
                },
              ));
        }
      ),
    );
  }
}
