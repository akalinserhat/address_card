part of '../address_card.dart';

class AddressCard extends StatelessWidget {
  final String id;
  final Image? titleImage;
  final int? stockTitleImage;
  final Image? mapImage;
  final String title;
  final String address;
  final String district;
  final String province;
  final String? phoneNumber;
  final BoxDecoration boxDecoration;
  final List<PopupMenuEntry<int>>? menuItems;
  final Function(int)? onTapMenuItem;
  // final Function(int)? onTapMenuItem;

  const AddressCard(
      {Key? key,
      required this.id,
      this.titleImage,
      this.stockTitleImage,
      this.mapImage,
      this.phoneNumber,
      this.boxDecoration = const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: 10,
                blurRadius: 50,
                offset: Offset(1, 1)),
          ]),
      this.menuItems,
      this.onTapMenuItem,
      required this.title,
      required this.address,
      required this.district,
      required this.province})
      : super(key: key);

  //********** Widgets ***********/

  Widget _avatarArea() {
    if (titleImage != null) {
      return const CircleAvatar();
    }

    if (stockTitleImage != null) {
      return CircleAvatar(
        backgroundImage: getAvatar(stockTitleImage!),
        // AssetImage("lib/assets/icons/$stockTitleImage.png",
        //     package: "address_card"),
      );
    }
    return const CircleAvatar();
  }

  Widget _titleArea() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _avatarArea(),
          const SizedBox(width: 5.0),
          Text(title),
        ],
      ),
    );
  }

  Widget _adressArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(address),
        Text("$district / $province"),
        const SizedBox(height: 10),
        Text((phoneNumber != null) ? phoneNumber! : ""),
      ],
    );
  }

  Widget _menuArea() {
    if (menuItems != null) {
      return PopupMenuButton<int>(
        itemBuilder: (context) => menuItems!,
        onSelected: (i) {
          if (onTapMenuItem != null) {
            onTapMenuItem!(i);
          } else {
            if (kDebugMode) {
              print("onTapMenuItem is null");
            }
          }
        },
      );
    } else {
      return Container();
    }
  }

  Widget _mapImage() {
    return const Center(
      child: CircleAvatar(
        radius: 50,
        backgroundImage:
            AssetImage("lib/assets/map_image.png", package: "address_card"),
      ),
    );
  }

  Widget _content() {
    return Padding(
      padding: const EdgeInsets.only(left: 13.0, right: 13),
      child: Row(
        //Content sperated two parts
        children: [
          Expanded(
              //Left side include title and address contents
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleArea(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  _adressArea(),
                ],
              )),
          Expanded(
            //Rigth side include menu and map image
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: _menuArea(),
                ),
                Expanded(flex: 3, child: _mapImage()),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 147.0,
      constraints: const BoxConstraints(maxWidth: 337.00),
      decoration: boxDecoration,
      child: _content(),
    );
  }
}
