import 'package:flutter/material.dart';
import 'package:movies_search_api/models/movie_model.dart';

class MovieDetailScreen extends StatelessWidget {
  MovieModel movieModel;

  MovieDetailScreen({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        title: const Text(
          'Movie Detail', style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 400,
                width: double.infinity,
                child: Image.network(movieModel.poster!),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.grey.withOpacity(.2),
                shadowColor: Colors.black12,
                child: Column(
                  children: [
                    Text(
                      'Title: ${movieModel.title}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Actors: ${movieModel.actors}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 10,),
                    Text('Director: ${movieModel.director}',
                      style: const TextStyle(fontSize: 18),),
                    const SizedBox(height: 10,),
                    Text('Runtime: ${movieModel.runtime}',
                      style: const TextStyle(fontSize: 18),),
                    const SizedBox(height: 10,),
                    Text('Released: ${movieModel.released}',
                      style: const TextStyle(fontSize: 18),),
                    const SizedBox(height: 10,),
                    Text('Genre: ${movieModel.genre}',
                      style: const TextStyle(fontSize: 18),),
                    const SizedBox(height: 10,),
                    Text('Year: ${movieModel.year}',
                      style: const TextStyle(fontSize: 18),),
                    const SizedBox(height: 10,),
                    Text('Response: ${movieModel.response}',
                      style: const TextStyle(fontSize: 18),),
                    const SizedBox(height: 10,),
                    Text('Country: ${movieModel.country}',
                      style: const TextStyle(fontSize: 18),),
                    const SizedBox(height: 10,),
                    Text('Box Office: ${movieModel.boxOffice}',
                      style: const TextStyle(fontSize: 18),),
                    const SizedBox(height: 10,),
                    Text('DVD: ${movieModel.dVD}',
                      style: const TextStyle(fontSize: 18),),
                    const SizedBox(height: 10,),
                    Text('IMDB Ratings: ${movieModel.imdbRating}',
                      style: const TextStyle(fontSize: 18),),
                    const SizedBox(height: 10,),
                    Text('Ratings: ${movieModel.ratings}',
                      style: const TextStyle(fontSize: 18),),
                    const SizedBox(height: 10,),
                    Text('Language: ${movieModel.language}',
                      style: const TextStyle(fontSize: 18),),
                    const SizedBox(height: 10,),
                    Text('Plot: ${movieModel.plot}',
                      style: const TextStyle(fontSize: 18),),
                    const SizedBox(height: 10,),
                    Text('Website: ${movieModel.website}',
                      style: const TextStyle(fontSize: 18),),
                    const SizedBox(height: 10,),
                    Text('Rated: ${movieModel.rated}',
                      style: const TextStyle(fontSize: 18),),
                    const SizedBox(height: 10,),
                    Text('Production: ${movieModel.production}',
                      style: const TextStyle(fontSize: 18),),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
