import 'package:apprendre_listes_et_grilles/model/course.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  List<String> courses = [
    "Carottes",
    "Tomages",
    "Cerises",
    "Poires",
    "Nutella",
    "Poisson",
    "Viande",
    "Dessert",
    "Liquide pour les mains",
    "Huile d'olive",
    "Brosse à dents",
    "Pain complet",
    "Croissant",
    "Pain aux chocolat",
    "Shampooing",
    "Lessive",
    "Rasoirs",
    "Après rasage",
    "Crème anti-âge",
    "Après shampooing",
    "Jeu pour Djibril",
    "Piles",
    "Serviettes",
    "Ampoules",
    "Verres",
    "Tasses",
    "Bols"
  ];

  List<Course> maListeDeCourses = [];

  List<Widget> itemCourses() {
    List<Widget> items = [];
    for (var element in courses) {
      final widget = elementToShow(element);
      items.add(widget);
    }
    return items;
  }

  Widget elementToShow(String element) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              element,
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.check_box_outline_blank)
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    for (var element in courses) {
      maListeDeCourses.add(Course(element: element));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Les listes et les grilles"),
        ),
        body:
            // ListView.builder(
            //     itemCount: courses.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       final element = courses[index];
            //       return elementToShow(element);
            //     })
            ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  final course = maListeDeCourses[index];
                  return ListTile(
                    title: Text(course.element),
                    leading: Text(index.toString()),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            course.update();
                          });
                        },
                        icon: Icon(course.bought
                            ? Icons.check_box
                            : Icons.check_box_outline_blank)),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.greenAccent,
                    thickness: 1,
                  );
                },
                itemCount: maListeDeCourses.length));
  }
}
