import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_proj/providers/convert_provider.dart';
import 'package:second_proj/widgets/build_drop_down_button.dart';

class Home extends StatelessWidget {
  var valueNumber = TextEditingController();
  late String dropdownValueTo;
  late String dropdownValueFrom;

  @override
  Widget build(BuildContext context) {
    print("Home page is build");
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Measure Converter",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Value",
                  textScaleFactor: 2.0,
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: TextField(
                    controller: valueNumber,
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(hintText: "please insert a value "),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "From",
                  textScaleFactor: 2.0,
                )),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BuildDropDownButton(
                    hint: 'Choose a unit of measure',
                    onChanged: (String value) {
                      dropdownValueFrom = value;
                    },
                    itemsList: [
                      'meters',
                      'kilometers',
                      'grams',
                      'kilograms',
                      'feet',
                      'miles',
                      'pounds (lbs)',
                      'ounces'
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "To",
                  textScaleFactor: 2.0,
                )),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BuildDropDownButton(
                    hint: 'Choose a unit of measure',
                    onChanged: (String value) {
                      dropdownValueTo = value;
                    },
                    itemsList: [
                      'meters',
                      'kilometers',
                      'grams',
                      'kilograms',
                      'feet',
                      'miles',
                      'pounds (lbs)',
                      'ounces'
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: RaisedButton(
                    onPressed: () {
                      //get the value of text filed
                      var valueoftextfiled =
                          double.parse(valueNumber.text.toString(), (v) => 0.0);
                      // pass the value to the backend to handel it
                      Provider.of<MyConverter>(context, listen: false).convert(
                          valueoftextfiled, dropdownValueFrom, dropdownValueTo);
                    },
                    child: Text(
                      "Convert",
                      style: TextStyle(color: Colors.indigo),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Consumer<MyConverter>(
                    builder: (context, provider, child) {
                      return Text(
                        "${provider.result}",
                        textScaleFactor: 2,
                      );
                    },
                  ))),
            ],
          ),
        ),
      ),
    ));
  }
}
