import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/screens/details_screen.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(movie: snapshot.data[index]),
                    ));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  // color: Colors.amber,
                  height: 200,
                  width: 150,

                  child: Image.network(
                    '${Constants.imagePath}${snapshot.data![index].posterPath}',
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
