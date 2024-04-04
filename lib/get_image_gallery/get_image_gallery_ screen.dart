import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetImageGalleryScreen extends StatefulWidget {
  const GetImageGalleryScreen({super.key});

  @override
  State<GetImageGalleryScreen> createState() => _GetImageGalleryScreenState();
}

class _GetImageGalleryScreenState extends State<GetImageGalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showImagePickerOptions(context);
                },
                child: const CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                      'https://cdn.popsww.com/blog/sites/2/2022/02/naruto-co-bao-nhieu-tap.jpg'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               IconButton(onPressed: (){}, icon:const Icon(Icons.photo_outlined)),
               IconButton(onPressed: (){}, icon:const Icon(Icons.camera_alt)),

              ],
            ),
          );
        });
  }
}
