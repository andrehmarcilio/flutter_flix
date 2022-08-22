import 'package:flutter/material.dart';
import 'package:flutter_movie_application/view/widgets/movies_list.dart';

import '../model/movies_models.dart';
import '../model_view/home_model_view.dart';
import 'widgets/popular_movie.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final modelView = HomeListViewModel();
    late ScrollController _controller;
    Color _cor = const Color.fromARGB(121, 0, 0, 0);
  
  @override
  void initState() {
    super.initState();
    modelView.getGeneros();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  _scrollListener() {
     if (_controller.offset <= 20) {
      setState(() {
        _cor = Colors.transparent;
      });
    } else {
      setState(() {
        _cor =  Color.fromARGB( _controller.offset > 121 ? 121 : _controller.offset.toInt() , 0, 0, 0); 
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title:  const Text("Flutter Flix", style: TextStyle( fontWeight: FontWeight.bold),),
        centerTitle: false,
         backgroundColor: _cor,
      ),
      body: ListView(
         controller: _controller,
         cacheExtent: 100,
        padding: const EdgeInsets.all(0),
        children: [
          PopularMovie(),
          StreamBuilder<List<Genero>>(
            stream: modelView.generosStreamController.stream,
            builder: (context, snapshot) {
              if(snapshot.hasData) {
               return  ListView.builder(
                 padding: const EdgeInsets.only(top: 30),
                 shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),
                 itemCount: snapshot.data!.length,
                    itemBuilder: (context, position)  {
                      return MoviesListWidget(
                        id: snapshot.data![position].id,
                        genero: snapshot.data![position].nome,
                      );
                    }, );
              } else {
                return const Center(child:  CircularProgressIndicator());
              }
            }  
          ),
        ],
      ),
    );
  }
}