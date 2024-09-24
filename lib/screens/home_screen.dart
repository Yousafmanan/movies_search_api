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
  var searchController = TextEditingController();
  late StreamController streamController;
  late Stream stream;

  void getMovie(String name) async {
    streamController.add('loading');
    var url = 'https://www.omdbapi.com/?t=$name&plot=full&apikey=c24388e4';
    var response = await https.get(Uri.parse(url));
    print('this is status code     ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      print('This Data is working $jsonData');
      if (jsonData['Response'] == 'True') {
        print('This Data is working $jsonData');
        MovieModel movieModel = MovieModel.fromJson(jsonData);
        streamController.add(movieModel);
      } else {
        Fluttertoast.showToast(msg: 'Data not found', fontSize: 15);
      }
    } else {
      Fluttertoast.showToast(msg: 'Something Went Wrong', fontSize: 15);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    streamController = StreamController();
    stream = streamController.stream;
    streamController.add('empty');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          "Movie Search",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(hintText: 'Search movie name here'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  if (searchController.text.isNotEmpty) {
                    print('Button Click');
                    getMovie(searchController.text);
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Please Provide Movie Name',
                        backgroundColor: Colors.blue);
                  }
                },
                child: const Text(
                  'Search',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
          const SizedBox(height: 20,),
            Expanded(child: StreamBuilder(
                stream: stream,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    if(snapshot.data == 'loading'){
                      return const Center(child: CircularProgressIndicator());
                    }else if(snapshot.data == 'empty'){
                      return const Center( child:  Text('Please Provide movie Name'),);
                    }else if(snapshot.data == 'not found'){
                      return const Center(child: Text("Movie Not Found "));
                    }else if (snapshot.data == 'went wrong'){
                      return const Center( child: Text('Something Went Wrong'),);
                    }else{
                      MovieModel movie = snapshot.data as MovieModel;
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                            return MovieDetailScreen(movieModel: movie,);
                          }));
                        },
                        child: SizedBox(
                          height: 300,
                          width: double.infinity,
                          child:  Image.network(movie.poster!),
                        ),
                      );
                    }
                  }else{
                    return const Center(child: CircularProgressIndicator(),);
                  }

                }))
          ],
        ),
      ),
    );
  }
}
