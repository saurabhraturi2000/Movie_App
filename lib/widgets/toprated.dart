import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import 'package:movie_app/description.dart';

class TopRated extends StatelessWidget {
  final List toprated;
  const TopRated({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Top Rated Movies',
            size: 26,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(0),
            height: 270,
            child: ListView.builder(
                itemCount: toprated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: toprated[index]['title'] ??
                                      toprated[index]['name'],
                                  description: toprated[index]['overview'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      toprated[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      toprated[index]['poster_path'],
                                  vote: toprated[index]['vote_average']
                                      .toString(),
                                  launchDate: toprated[index]
                                      ['release_date'])));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      width: 140,
                      child: Column(children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      toprated[index]['poster_path']),
                            ),
                          ),
                        ),
                        ModifiedText(
                          color: Colors.white,
                          size: 12,
                          text: toprated[index]['title'] ?? 'Loading',
                        )
                      ]),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
