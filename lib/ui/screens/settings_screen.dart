import 'package:flutter/material.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:flutter_picker/Picker.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _hours = 0;
  int _minutes = 0;

  showPickerNumber(BuildContext context) {
    new Picker(
        selectedTextStyle: TextStyle(color: Colors.white, fontSize: 23),
        textStyle: TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: kBackgroundColor,
        magnification: 1.1,
        containerColor: kBackgroundColor,
        adapter: NumberPickerAdapter(
          data: [
            NumberPickerColumn(begin: 0, end: 24),
            NumberPickerColumn(begin: 0, end: 60),
          ],
        ),
        delimiter: [
          PickerDelimiter(
            child: Container(
              // decoration: BoxDecoration(color: kBackgroundColor),
              width: 30.0,
              alignment: Alignment.center,
              child: Text(
                ":",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
              ),
            ),
          ),
        ],
        //TODO Style Cancel Confirm widgets and add functionality
        hideHeader: true,
        title: Center(child: Text("Default Timer")),
        onConfirm: (Picker picker, List value) {
          _hours = value[0];
          _minutes = value[1];
        }).showDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: kBackgroundColor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 110,
            title: Text("Settings"),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            // flexibleSpace: Spacer(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: ListTile(
                    title: Text("Default Timer"),
                    onTap: () {
                      showPickerNumber(context);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
