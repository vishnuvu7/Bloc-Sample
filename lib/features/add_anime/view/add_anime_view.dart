import 'package:flutter/material.dart';


class AddAnimeScreen extends StatelessWidget {
  const AddAnimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: '');
    final characterController = TextEditingController(text: '');
    // final addAnimeBuilder = ref.watch(addAnimeProvider);
    // final animeListener = ref.read(addAnimeProvider.notifier);
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
                  )
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
            width: 250,
            child: TextField(
              controller: characterController,
              decoration: InputDecoration(
                  label: const Text("Main Character"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            // animeListener.addAnime(nameController.text, characterController.text);
          }, child: const Text("Add new anime")),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                // onTap: () => animeListener.removeAnime(addAnimeBuilder[index]),
                title: Text("Hello"),
                subtitle: Text("Characters"),
                leading: const CircleAvatar(child: Text("0")),
              ),
              itemCount: 5,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
          )        ],
      ),
    );
  }
}
