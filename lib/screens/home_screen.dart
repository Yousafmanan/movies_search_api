import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as https;
import 'package:flutter/material.dart';
import 'package:movies_search_api/models/movie_model.dart';
import 'movie_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  late final StreamController streamController;
  late final Stream stream;
  bool isSearching = false;

  void getMovie(String name) async {
    //streamController.add('loading');
    var url = 'https://www.omdbapi.com/?t=$name&plot=full&apikey=c24388e4';
    try {
      var response = await https.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        if (jsonData['Response'] == 'True') {
          streamController.add(MovieModel.fromJson(jsonData));
        } else {
          streamController.add('not found');
        }
      } else {
        streamController.add('went wrong');
      }
    } catch (e) {
      streamController.add('went wrong');
    }
  }

  @override
  void initState() {
    streamController = StreamController();
    stream = streamController.stream;
    streamController.add('empty');
    super.initState();
  }

  @override
  void dispose() {
    streamController.close();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text('Movie Search', style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(hintText: 'Search movie name here'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              onPressed: isSearching
                  ? null
                  : () async {
                if (searchController.text.trim().isNotEmpty) {
                  setState(() => isSearching = true);
                  getMovie(searchController.text);
                  setState(() => isSearching = false);
                } else {
                  Fluttertoast.showToast(msg: 'Please provide a movie name.');
                }
              },
              child: isSearching
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Search', style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder(
                stream: stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data) {
                      case 'loading':
                        return const Center(child: CircularProgressIndicator());
                      case 'empty':
                        return const Center(child: Text('Please provide a movie name.'));
                      case 'not found':
                        return const Center(child: Text('Movie not found.'));
                      case 'went wrong':
                        return const Center(child: Text('Something went wrong.'));
                      default:
                        MovieModel movie = snapshot.data as MovieModel;
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => MovieDetailScreen(movieModel: movie),
                            ));
                          },
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Image.network(movie.poster ?? 'https://via.placeholder.com/400'),
                                const SizedBox(height: 20),
                                const Text('Click on Poster for more details',
                                    style: TextStyle(fontSize: 16, color: Colors.deepPurple ,fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        );
                    }
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

