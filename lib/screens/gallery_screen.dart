import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/photo_model.dart';
import 'package:flutter_application_1/services/photo_api.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  api_service client = api_service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Gallery',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.brown,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: const BoxDecoration(color: Colors.white),
                child: FutureBuilder(
                  future: client.getPhoto(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<photo>> snapshot) {
                    if (snapshot.hasData) {
                      //  List<photo>? id = snapshot.data;

                      return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 2),
                          itemCount: 50,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                              image: NetworkImage(snapshot.data[index]),
                            )));
                          });
                    }
                    return Center(child: Text('ERROR'));
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Share',
        child: const Icon(Icons.share),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
