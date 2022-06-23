import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launchDate;
  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launchDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Stack(
            children: [
              Positioned(
                child: Container(
                  padding: const EdgeInsets.all(0),
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(bannerurl, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: 10,
                child: ModifiedText(
                    text: 'Average Rating - $vote',
                    color: Colors.white,
                    size: 15),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ModifiedText(
              text: name,
              color: Colors.white,
              size: 20,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: ModifiedText(
              text: 'Release Date - $launchDate',
              size: 15,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: ModifiedText(
                  text: description,
                  size: 15,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
