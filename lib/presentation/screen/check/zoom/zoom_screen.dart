import 'package:check_my_bike_flutter/presentation/router/slide_right_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../resources/colors_res.dart';

class ZoomScreen extends StatelessWidget {
  final String _imageUrl;

  static void show(BuildContext context, String imageUrl) {
    Navigator.push(context, SlideRightRoute(ZoomScreen(imageUrl)).createRoute());
  }

  const ZoomScreen(this._imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: _buildGradientDecoration(),
        child: Stack(children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: InteractiveViewer(maxScale: 50, child: _buildPhoto(_imageUrl))),
          Column(children: [_buildAppBar(context), const Spacer()])
        ]));
  }

  BoxDecoration _buildGradientDecoration() {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorsRes.startGradient, ColorsRes.endGradient]));
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 65,
      backgroundColor: ColorsRes.darkGreyOpacity75,
      shadowColor: Colors.transparent,
      shape: _buildAppBarBorder(),
      title: Text('bike_screen.zoom'.tr()),
      actions: [_buildToolbarFavoriteIcon()],
      centerTitle: true,
      iconTheme: IconThemeData(color: ColorsRes.green, size: 30),
      titleTextStyle: _buildTextStyle(),
      leading: _buildBackButton(context),
    );
  }

  OutlinedBorder _buildAppBarBorder() {
    return RoundedRectangleBorder(
        side: BorderSide(width: 0.15, color: ColorsRes.green),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)));
  }

  Widget _buildToolbarFavoriteIcon() {
    return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Icon(Icons.pinch, color: ColorsRes.green, size: 23));
  }

  TextStyle _buildTextStyle() {
    return TextStyle(
        fontFamily: 'Roboto Thin',
        color: ColorsRes.green,
        fontSize: 'bike_screen.zoom'.tr().length > 10 ? 30 : 35);
  }

  Widget _buildBackButton(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios, color: ColorsRes.green, size: 25.0),
        onPressed: () => Navigator.pop(context));
  }

  Widget _buildPhoto(String imgUrl) {
    return Image.network(imgUrl, loadingBuilder: (context, image, progress) {
      if (progress != null) {
        return _buildProgressIndicator(progress);
      }
      return image;
    });
  }

  Widget _buildProgressIndicator(ImageChunkEvent progress) {
    double? value = progress.cumulativeBytesLoaded / (progress.expectedTotalBytes ?? 1);
    return Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: CircularProgressIndicator(value: value, strokeWidth: 0.4));
  }
}
