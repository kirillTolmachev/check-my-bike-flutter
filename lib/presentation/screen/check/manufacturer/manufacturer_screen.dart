import 'package:check_my_bike_flutter/presentation/models/bike.dart';
import 'package:check_my_bike_flutter/presentation/screen/check/base/base_check_state.dart';
import 'package:check_my_bike_flutter/presentation/screen/check/details_screen.dart';
import 'package:check_my_bike_flutter/presentation/screen/check/info.dart';
import 'package:check_my_bike_flutter/presentation/screen/widgets/input_form.dart';
import 'package:flutter/material.dart';

import '../../../validator/validator.dart';

class ManufacturerScreen extends StatefulWidget {
  static show(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ManufacturerScreen()));
  }

  const ManufacturerScreen({Key? key}) : super(key: key);

  @override
  _ManufacturerScreenState createState() => _ManufacturerScreenState();
}

class _ManufacturerScreenState extends BaseCheckState<ManufacturerScreen> {
  List<Bike> _bikes = [];

  _ManufacturerScreenState() : super("manufacturer") {
    _bikes = _buildBikes();
  }

  //todo: only for development
  List<Bike> _buildBikes() {
    return [
      Bike(410882, true, "Scott", "SWBD312L0482P", "stolen", "2018 Fuji ABOSLUTE 1.1", 2021, true,
          largeImg: "https://bikeindex.org/bikes/410882",
          stolenLocation: "Tallahassee, FL 32303, US",
          description:
              "Big, heavy e-bike with a headlight and detachable center console, room for a second rider on the back.",
          colors: ["Silver, gray or bare metal", "silver"]),
      Bike(410882, true, "Commanche", "SWBD312L0482P", "stolen", "2021 Fuji ABOSLUTE 1.1", 2021,
          true,
          largeImg: "https://bikeindex.org/bikes/410882",
          stolenLocation: "USA, FL 32303, US",
          description:
              "Big, heavy e-bike with a headlight and detachable center console, room for a second rider on the back.",
          colors: ["Silver, gray or bare metal", "silver"]),
      Bike(410882, true, "Commanche", "SWBD312L0482P", "stolen", "2021 Fuji ABOSLUTE 1.1", 2021,
          true,
          largeImg: "https://bikeindex.org/bikes/410882",
          stolenLocation: "USA, FL 32303, US",
          description:
              "Big, heavy e-bike with a headlight and detachable center console, room for a second rider on the back.",
          colors: ["Silver, gray or bare metal", "silver"]),
      Bike(410882, true, "Commanche", "SWBD312L0482P", "stolen", "2021 Fuji ABOSLUTE 1.1", 2021,
          true,
          largeImg: "https://bikeindex.org/bikes/410882",
          stolenLocation: "USA, FL 32303, US",
          description:
              "Big, heavy e-bike with a headlight and detachable center console, room for a second rider on the back.",
          colors: ["Silver, gray or bare metal", "silver"])
    ];
  }

  @override
  List<Widget> getWidgets() {
    return [_buildInputForm(), _buildListView()];
  }

  Widget _buildInputForm() {
    return InputForm("manufacturer", (textToSearch) {
      //todo: bloc
    }, (textForValidator) {
      return Validator.moreThenFourSymbols(textForValidator);
    }, "Please enter more then 4 symbols");
  }

  Widget _buildListView() {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 0.7,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: _bikes.length,
          itemBuilder: (context, index) {
            return Info(_bikes[index], onInfoPressed: (bike) => DetailsScreen.show(context, bike));
          },
        ));
  }
}
