import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_application/view/details_page.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({Key? key, required this.imageUrl, required this.id}) : super(key: key);
  final String imageUrl;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 214,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => DetailPage(id: id))),),
            child: CachedNetworkImage(imageUrl: 
              "https://image.tmdb.org/t/p/w500/" + imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
