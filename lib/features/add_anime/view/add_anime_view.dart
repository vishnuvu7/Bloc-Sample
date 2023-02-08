import 'package:bloc_sample/di/di.dart';
import 'package:bloc_sample/features/add_anime/cubit/add_anime_cubit.dart';
import 'package:bloc_sample/features/add_anime/model/add_anime_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAnimeScreen extends StatelessWidget {
  const AddAnimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: '');
    final characterController = TextEditingController(text: '');
    // final addAnimeBuilder = ref.watch(addAnimeProvider);
    // final animeListener = ref.read(addAnimeProvider.notifier);
    return BlocProvider<AddAnimeCubit>(
      create: (context) => locate<AddAnimeCubit>(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Add Anime"),
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: 250,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      label: const Text("Anime Name"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                width: 250,
                child: TextField(
                  controller: characterController,
                  decoration: InputDecoration(
                      label: const Text("Main Character"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    final addBloc = context.read<AddAnimeCubit>();
                    addBloc.addAnime(nameController.text, characterController.text);
                    // animeListener.addAnime(nameController.text, characterController.text);
                  },
                  child: const Text("Add new anime")),
              Expanded(
                child: BlocBuilder<AddAnimeCubit, List<AddAnimeModel>>(
                  builder: (context, state) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () {
                          final removeBloc = context.read<AddAnimeCubit>();
                          removeBloc.removeAnime(state[index]);
                        },
                        title: Text(state[index].anime),
                        subtitle: Text(state[index].character),
                        leading: const CircleAvatar(child: Text("0")),
                      ),
                      itemCount: state.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    );
                  },
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
