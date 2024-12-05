import 'package:flutter/material.dart';
import 'package:movies_search_api/models/movie_model.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieModel movieModel;

  MovieDetailScreen({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          'Movie Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Poster
            SizedBox(
              height: 400,
              width: double.infinity,
              child: movieModel.poster != null && movieModel.poster!.isNotEmpty
                  ? Image.network(
                movieModel.poster!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Text('Image not available'));
                },
              )
                  : const Center(child: Text('Poster not available')),
            ),
            const SizedBox(height: 20),

            // Movie Details Card
            Card(
              color: Colors.deepPurple.withOpacity(0.2),
              shadowColor: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('Title', movieModel.title),
                    _buildDetailRow('Year', movieModel.year),
                    _buildDetailRow('Rated', movieModel.rated),
                    _buildDetailRow('Runtime', movieModel.runtime),
                    _buildDetailRow('Released', movieModel.released),
                    _buildDetailRow('Genre', movieModel.genre),
                    _buildDetailRow('Actors', movieModel.actors),
                    _buildDetailRow('Director', movieModel.director),
                    _buildDetailRow('Writer', movieModel.writer),
                    _buildDetailRow('Country', movieModel.country),
                    _buildDetailRow('Box Office', movieModel.boxOffice ?? 'N/A'),
                    _buildDetailRow('IMDB Rating', movieModel.imdbRating),
                    _buildDetailRow('Language', movieModel.language),
                    _buildDetailRow('Production', movieModel.production ?? 'N/A'),
                    _buildDetailRow('Plot', movieModel.plot),
                    _buildDetailRow('Website', movieModel.website ?? 'N/A'),
                    _buildDetailRow('Awards', movieModel.awards),
                    _buildDetailRow('Type', movieModel.type),
                    _buildDetailRow('Ratings Source', movieModel.ratings![0].source),
                    _buildDetailRow('Ratings', movieModel.ratings![0].value),
                    _buildDetailRow('Ratings Source', movieModel.ratings![1].source),
                    _buildDetailRow('Ratings', movieModel.ratings![1].value),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Detail Rows
  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value ?? 'N/A',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
