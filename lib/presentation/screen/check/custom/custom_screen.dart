import 'package:check_my_bike_flutter/domain/entity/bike_entity.dart';
import 'package:check_my_bike_flutter/presentation/screen/check/base/base_check_state.dart';
import 'package:check_my_bike_flutter/presentation/screen/check/details/details_screen.dart';
import 'package:check_my_bike_flutter/presentation/screen/check/info/info_item.dart';
import 'package:flutter/material.dart';

import '../../../validator/validator.dart';
import '../../../widgets/input_form/input_form.dart';

class CustomScreen extends StatefulWidget {
  static show(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomScreen()));
  }

  const CustomScreen({Key? key}) : super(key: key);

  @override
  _CustomScreenState createState() => _CustomScreenState();
}

class _CustomScreenState extends BaseCheckState<CustomScreen> {
  List<BikeEntity> _bikes = [];

  _CustomScreenState() : super("custom") {
    _bikes = _buildBikes();
  }

  //todo: only for development
  List<BikeEntity> _buildBikes() {
    return [];
  }

  @override
  List<Widget> getWidgets() {
    return [_buildInputForm(), _buildListView()];
  }

  Widget _buildInputForm() {
    return SliverToBoxAdapter(
        child: InputForm("parameter", (textToSearch) {
      //todo: bloc
    }, (textForValidator) {
      return Validator.moreThenTwoSymbols(textForValidator);
    }, "Please enter more then 2 symbols"));
  }

  Widget _buildListView() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return _buildInfoItem(_bikes[index]);
    }, childCount: _bikes.length));
  }

  Widget _buildInfoItem(BikeEntity bike) {
    return InfoItem(bike,
        onPressedInfo: (bike) => DetailsScreen.show(context, bike),
        onPressedFavorite: (bike) => print("pressed favorite: ${bike.manufacturerName}"));
  }
}
