import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import 'package:movie_app/description.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: 'TV Shows',
            size: 26,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                itemCount: tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: tv[index]['title'] ?? tv[index]['name'],
                                  description: tv[index]['overview'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      tv[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      tv[index]['poster_path'],
                                  vote: tv[index]['vote_average'].toString(),
                                  launch_date: tv[index]['first_air_date'])));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(children: [
                        Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      tv[index]['backdrop_path'],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: modified_text(
                            color: Colors.white,
                            size: 12,
                            text: tv[index]['name'] ?? 'Loading',
                          ),
                        )
                      ]),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
