import 'package:check_my_bike_flutter/presentation/models/manufacturer.dart';
import 'package:check_my_bike_flutter/presentation/screen/widgets/input_form.dart';
import 'package:flutter/material.dart';

import '../../../validator/validator.dart';
import '../../base/base_screen_state.dart';
import '../manufacturer_item.dart';

class DatabaseByNameScreen extends StatefulWidget {
  const DatabaseByNameScreen({Key? key}) : super(key: key);

  @override
  _DatabaseByNameScreenState createState() => _DatabaseByNameScreenState();
}

class _DatabaseByNameScreenState extends BaseScreenState<DatabaseByNameScreen> {
  List<Manufacturer>? _items;

  _DatabaseByNameScreenState() {
    _items = _buildItems();
  }

  //todo: mock items, only for development
  List<Manufacturer> _buildItems() {
    return [
      Manufacturer("Scott", "scott.com", false),
      Manufacturer("Comanche", "comanche.com", true,
          imageUrl: "files.bikeindex.org/uploads/Ma/957/Nashbarcom.png"),
      Manufacturer(
        "Dean",
        "dean.com",
        false,
      ),
      Manufacturer("Nashbar", "nashbar.com", false),
      Manufacturer("National", "national.com", true),
      Manufacturer("Nakto", "nakto.com", false),
      Manufacturer("NEMO", "nemo.com", false,
          imageUrl: "files.bikeindex.org/uploads/Ma/957/Nashbarcom.png"),
      Manufacturer("Harry Quinn", "harry-quinn.com", false),
      Manufacturer("Hasa", "hasa.com", true),
      Manufacturer("Head", "head.com", true),
      Manufacturer("Heritage", "heritage.com", false,
          imageUrl: "files.bikeindex.org/uploads/Ma/957/Nashbarcom.png"),
      Manufacturer("Hoffman", "hoffman.com", true,
          imageUrl: "files.bikeindex.org/uploads/Ma/957/Nashbarcom.png"),
      Manufacturer("Ideal Bikes", "ideal-bikes.com", false),
      Manufacturer("Iron Horse Bikes", "iron-horse-bikes.com", false),
      Manufacturer("Jetson", "jetson.com", true),
      Manufacturer("K2", "k2.com", true),
      Manufacturer("Kelly", "kelly.com", true,
          imageUrl: "files.bikeindex.org/uploads/Ma/957/Nashbarcom.png"),
      Manufacturer("Kestrel", "kestrel.com", false),
      Manufacturer("Kinesis", "kinesis.com", false),
      Manufacturer("Koga-Miyata", "koga-miyata.com", false)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      InputForm("Manufacturer's name", (text) => print("pressed find by name: $text"), (text) {
        return Validator.moreThenOneSymbol(text);
      }, "Please enter more then 1 symbols"),
      Container(
          margin: const EdgeInsets.only(top: 15),
          height: MediaQuery.of(context).size.height - 320,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: _items?.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.transparent,
                child: Center(
                    child: ManufacturerItem(
                        _items![index],
                        (manufacturer) => print(
                            "pressed: ${manufacturer.name}, favorite: ${manufacturer.favorite}"),
                        (manufacturer) => print(
                            "pressed: ${manufacturer.name}, url: ${manufacturer.companyUrl}"))),
              );
            },
          ))
    ]);
  }
}
