part of '../address_card.dart';

class AddressCard extends StatelessWidget {
  final String id;
  final Image? titleImage;
  final String? avatarUrl;
  final Image? mapImage;
  final String title;
  final String address;
  final String district;
  final String province;
  final String? phoneNumber;
  final BoxDecoration boxDecoration;
  final List<PopupMenuItem<Function(BuildContext context, String id)>>?
      menuItems;
  // final Function(BuildContext context, int index, String id)? onTapMenuItem;
  // final Function(int)? onTapMenuItem;

  const AddressCard(
      {Key? key,
      required this.id,
      this.titleImage,
      this.avatarUrl,
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
      // this.onTapMenuItem,
      required this.title,
      required this.address,
      required this.district,
      required this.province})
      : super(key: key);

  //********** Widgets ***********/

  Widget _avatarArea() {
    String url = (avatarUrl != null)
        ? avatarUrl!
        : "$protocolAvatar$pathDefaultAddressAvatar";
    return SizedBox(
      height: 50,
      width: 50,
      child: CircleAvatarHasAction(
        controller: CircleAvatarHasActionController(url: url),
      ),
    );
  }

  Widget _titleArea(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _avatarArea(),
          const SizedBox(width: 5.0),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
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

  Widget _menuArea(BuildContext context) {
    if (menuItems == null) return Container();

    return PopupMenuButton<Function(BuildContext context, String id)>(
      itemBuilder: (context) => menuItems!,
      onSelected: (value) => value(context, id),
    );
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

  Widget _content(BuildContext context) {
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
                  _titleArea(context),
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
                  child: _menuArea(context),
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
    return Card(
      color: Theme.of(context).cardTheme.color,
      child: SizedBox(
        height: 147.0,
        child: _content(context),
      ),
    );
  }
}
