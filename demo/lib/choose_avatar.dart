import 'package:flutter/material.dart';
import 'package:avatar_gallery/avatar_gallery.dart';

class ChooseAvatar extends StatefulWidget {
  const ChooseAvatar({Key? key}) : super(key: key);

  @override
  State<ChooseAvatar> createState() => _ChooseAvatarState();
}

class _ChooseAvatarState extends State<ChooseAvatar> {
  // String avatarId = "0";

  AssetImage image = const AssetImage(
    "lib/assets/0.png",
    package: "avatar_gallery",
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: image,
          //  AssetImage(
          //   "lib/assets/$avatarId.png",
          //   package: "avatar_gallery",
          // ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        ElevatedButton(
            onPressed: () async {
              var assetImage = await showSearch<List<AssetImage?>>(
                  context: context, delegate: AvatarPickup());
              if (assetImage == null) {
                print("asset image is null");
              } else {
                print(
                    "asset image is not null. Length is ${assetImage.length}");
              }
              if (assetImage != null && assetImage.isNotEmpty) {
                setState(() {
                  print("setting new asset image");
                  image = assetImage[0]!;
                });
              }
            },
            child: const Text("Icon Gallery"))
      ],
    );
  }
}
