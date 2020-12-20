import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location/data/data.dart';
import 'package:location/model/categories_model.dart';
import 'package:location/model/wallpaper_model.dart';
import 'package:location/views/category.dart';
import 'package:location/views/image_view.dart';
import 'package:location/views/search.dart';
import 'package:location/widgets/widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = List();
  List<WallpaperModel> wallpapers = List();
  TextEditingController searchController = TextEditingController();

  getTrendingWallpaper() async {
    var response = await http.get(
        "https://api.pexels.com/v1/curated?per_page=80&page=1",
        headers: {"Authorization": apiKey});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getTrendingWallpaper();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: brandname(),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                    color: Color(0xfff5f8fd),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'search wallpaper',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Search(
                                        searchQuery: searchController.text,
                                      )));
                        },
                        child: Container(child: Icon(Icons.search)))
                  ],
                ),
              ),
              SizedBox(height: 8,),
              wallpapersList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 100.0,
              child: DrawerHeader(
                child: Text(
                  'Categories',
                  style:
                      GoogleFonts.firaSans(fontSize: 40.0, color: Colors.white),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/pic.jpg"), fit: BoxFit.cover),
                ),
              ),
            ),
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categories == null ? 0 : categories.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return CategroiesTile(
                        title: categories[index].categoriesName);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class CategroiesTile extends StatelessWidget {
  final title;

  CategroiesTile({@required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Category(
                      categoryName: title.toLowerCase(),
                    )));
      },
      child: Expanded(
        child: ClipRRect(
          child: Container(
            alignment: Alignment.center,
            height: 62,
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Text(
                  title,
                  style: GoogleFonts.yanoneKaffeesatz(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
