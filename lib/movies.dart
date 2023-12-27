import 'package:flutter/material.dart';

class MoviesPage extends StatelessWidget {
  MoviesPage({Key? key}) : super(key: key);

  List<String> images = [
    'https://source.unsplash.com/250x250/?portrait',
  "https://igimages.gumlet.io/hindi/gallery/movies/raabta/raaabta_poster.jpg?w=240&dpr=1.0",
  "https://igimages.gumlet.io/hindi/gallery/movies/tubelight/tubelight_poster.jpg?w=240&dpr=1.0",
  "https://igimages.gumlet.io/hindi/gallery/movies/dobaara/dobara_poster.jpg?w=240&dpr=1.0",
  "https://igimages.gumlet.io/hindi/gallery/movies/bankchor/bank_poster.jpg?w=240&dpr=1.0",
  "https://igimages.gumlet.io/hindi/gallery/movies/dearmaya/maya_poster.jpg?w=240&dpr=1.0",
  "https://igimages.gumlet.io/hindi/gallery/movies/mom/mom_poster.jpg?w=240&dpr=1.0",
  "https://igimages.gumlet.io/hindi/gallery/movies/bahubali2/bahubali_poster.jpg?w=240&dpr=1.0",
  "https://igimages.gumlet.io/hindi/gallery/movies/commando2/commando_poster.jpg?w=240&dpr=1.0",
  "https://stat5.bollywoodhungama.in/wp-content/uploads/2016/03/89650084-306x393.jpg",
  "https://stat4.bollywoodhungama.in/wp-content/uploads/2016/03/83723409-306x393.jpg",
  "https://igimages.gumlet.io/hindi/gallery/movies/raees/raeees_poster.jpg?w=240&dpr=1.0",
  "https://igimages.gumlet.io/hindi/gallery/movies/haraamkhor/haaram_poster.jpg?w=240&dpr=1.0",
  "https://igimages.gumlet.io/hindi/gallery/movies/trapped/trapped_poster.jpg?w=240&dpr=1.0",
  "https://igimages.gumlet.io/hindi/gallery/movies/mubarakan/mubarakan_poster.jpg?w=240&dpr=1.0",
  "https://igimages.gumlet.io/hindi/gallery/movies/bareillykibarfi/barfi_poster.jpg?w=240&dpr=1.0",
  "https://igimages.gumlet.io/hindi/gallery/movies/chef/chef_poster.jpg?w=240&dpr=1.0",
  "https://igimages.gumlet.io/hindi/gallery/movies/jollyllb2/jelly_poster.jpg?w=240&dpr=1.0",
  "https://igimages.gumlet.io/hindi/gallery/movies/theghaziattack/ghazi_poster.jpg?w=240&dpr=1.0",
  "https://igimages.gumlet.io/hindi/gallery/movies/phillauri/phil_poster.jpg?w=240&dpr=1.0",
];

List<String> movieTitles = [
  "Kantara",
  "Raabta",
  "Tubelight",
  "Dobaara",
  "Bank Chor",
  "Dear Maya",
  "Mom",
  "Baahubali 2",
  "Commando 2",
  "Title 10",
  "Title 11",
  "Raees",
  "Haraamkhor",
  "Trapped",
  "Mubarakan",
  "Bareilly Ki Barfi",
  "Chef",
  "Jolly LLB 2",
  "The Ghazi Attack",
  "Phillauri",
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Reduce the number of columns
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
          ),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {

            return  Container(
              height: 140,
              width: 100,
              child: Column(
                children: [
                  Image.network(images[index],height: 100, width: 110,),
                  Text(
                    movieTitles[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.0), // Reduce font size
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}