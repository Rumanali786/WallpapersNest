import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:location/model/wallpaper_model.dart';
import 'package:location/views/image_view.dart';


Widget brandname() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Wallpapers",style: GoogleFonts.firaSans(
        color: Colors.black87,
      ),),
      Text("Nest",style: GoogleFonts.firaSans(
        color: Colors.blue,
      ),)
    ],
  );
}


Widget wallpapersList({List<WallpaperModel> wallpapers, context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        crossAxisCount: 2,
    childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(child: GestureDetector(
          onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => ImageView(
                imgUrl: wallpaper.src.portrait,
              )
          ));
        },
          child: Hero(
            tag: wallpaper.src.portrait,
            child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(wallpaper.src.portrait,fit: BoxFit.cover,)),
            ),
          ),
        ),);
      }).toList(),
    ),
  );
}