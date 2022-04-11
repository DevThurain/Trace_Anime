import 'dart:io';

import 'package:anime_tracker/presentation/home/bloc/search_image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? file = null;
  late SearchImageBloc searchImageBloc;

  @override
  void initState() {
    searchImageBloc = SearchImageBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchImageBloc>(
      create: (context) => searchImageBloc,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Search Anime'),
          ),
          floatingActionButton: Builder(builder: (context) {
            return FloatingActionButton(
              child: Icon(Icons.search),
              onPressed: () async {
                file = await _picker.pickImage(source: ImageSource.gallery);

                if (file != null) {
                  searchImageBloc
                      .add(EventMakeSearchImage(image: File(file!.path)));
                }
              },
            );
          }),
          body: BlocBuilder<SearchImageBloc, SearchImageState>(
            builder: (context, state) {
              print("=====> " + state.toString());
              if (state is SearchImageCompleteState) {
                return ListView.builder(
                  itemCount: state.result.result?.length ?? 0,
                  itemBuilder: ((context, index) {
                    var item = state.result.result![index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.network(item.image.toString()),
                        Text((item.filename).toString()),
                        Text((item.similarity! * 100).toString()),
                      ],
                    );
                  }),
                );
              }
              if (state is SearchImageLoadingState) {
                return CircularProgressIndicator();
              }
              if (state is SearchImageErroreState) {
                return Text(state.appError.message);
              } else {
                return Text(state.toString());
              }
            },
          )),
    );
  }
}
