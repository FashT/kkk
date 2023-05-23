import 'package:flutter/material.dart';
import 'package:praticeeee/mount_model.dart';

final Color mainColor = Color(0xFFFF5656);
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MountsApp(),
    ),
  );
}

class MountsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: mainColor,
        ),
        title: Center(
          child: Icon(
            Icons.terrain,
            size: 50,
          ),
        ),
        actions: [
          SizedBox(
            width: 40,
            height: 40,
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(30),
          color: mainColor,
          alignment: Alignment.bottomLeft,
          child: Icon(
            Icons.terrain,
            size: 80,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AppHeader(),
          AppSearch(),
          Expanded(
            child: AppMountListview(),
          ),
          AppCategoryListView(),
          AppBottomBar(),
        ],
      ),
    );
  }
}
//---------------Widgets-----------

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/fash.jpg',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Roman',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Good morning',
                style: TextStyle(color: mainColor, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//---------------AppSearch---------------'Discover'
class AppSearch extends StatelessWidget {
  const AppSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'search',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.tune,
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

//-----------------------Widgets---------------
class AppMountListview extends StatelessWidget {
  const AppMountListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mountItems.length,
        itemBuilder: (buildContext, index) {
          MountModel currentMount = mountItems[index];

          return Container(
            width: 150,
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(
                  currentMount.path,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentMount.name,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  currentMount.location,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        });
  }
}

//-------------------Models----------------
// class MountModel {
//   final String path;
//   final String name;
//   final String location;
//   final String description;
//   MountModel({
//     this.description = '',
//     this.location = '',
//     this.name = '',
//     this.path = '',
//   });
// }
class AppCategoryListView extends StatelessWidget {
  const AppCategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'More',
                    style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            height: 100,
            child: ListView.builder(
              itemBuilder: (context, index) {
                CategoryModel currentCategory = categories[index];
                return Container(
                  width: 100,
                  margin: EdgeInsets.only(top: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        currentCategory.icon,
                        color: mainColor,
                      ),
                      Text(
                        currentCategory.category,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  @override
  Widget build(BuildContext context) {
    List<AppBottomBarItem> barItems = [
  AppBottomBarItem(icon: Icons.home, label: 'Home', isSelected: true),
    AppBottomBarItem(icon: Icons.explore, label: 'Explore', isSelected: false),
    AppBottomBarItem(icon: Icons.turned_in_not, label: 'Tag', isSelected: false),
    AppBottomBarItem(icon: Icons.person_outline, label: 'Profile', isSelected: false),
];
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Text('Bottom Bar'),
    );
  }
}
