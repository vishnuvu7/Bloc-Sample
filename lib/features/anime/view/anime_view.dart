import 'package:bloc_sample/di/di.dart';
import 'package:bloc_sample/features/anime/cubit/anime_cubit.dart';
import 'package:bloc_sample/features/anime/model/resposne/anime_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnimeCubit>(
      create: (context) => locate<AnimeCubit>(),
      child: Builder(
        builder: (context) {
          final AnimeCubit bloc = BlocProvider.of<AnimeCubit>(context);

          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Bloc Sample app",
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.dark_mode,
                      )),
                ],
              ),
              floatingActionButton: FloatingActionButton(onPressed: () {
                bloc.refreshApi();
              }, child: const Icon(Icons.refresh)),
              body: BlocBuilder<AnimeCubit, AnimeState>(
                //Bloc builder is same as Obx wrapped widget will change when data changes
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case AnimeLoaded<List<AnimeListResponse>>:
                      List<AnimeListResponse> animeList = (state as AnimeLoaded).data;
                      return ListView.separated(
                        itemBuilder: (context, index) =>
                            ListTile(
                              onTap: () {},
                              title: Text(animeList[index].anime),
                              leading: CircleAvatar(child: Text(animeList[index].anime.substring(0, 1).toString())),
                            ),
                        itemCount: animeList.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                      );
                    case AnimeLoading:
                      return const Center(child: CircularProgressIndicator());
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
