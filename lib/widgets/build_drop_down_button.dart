import 'package:flutter/material.dart';

class BuildDropDownButton extends StatefulWidget {
  final String hint ;
   String? dropDownValueFrom ;
  final ValueChanged<String> onChanged;
  final List<String> itemsList;



   BuildDropDownButton({ required this.hint, required this.onChanged, required this.itemsList}) ;
  @override
  _BuildDropDownButtonState createState() => _BuildDropDownButtonState();
}

class _BuildDropDownButtonState extends State<BuildDropDownButton> {
  @override
  Widget build(BuildContext context) {
    print("dropdown is called from  inside");
    return DropdownButton<String>(
      focusColor: Colors.indigo,
      autofocus: true,
      value: widget.dropDownValueFrom,
      isExpanded: true,
      hint: Text(widget.hint),
      onChanged: (String? newValue ) {
        setState(() {
          widget.dropDownValueFrom = newValue  ;
        });
        if(newValue==null){newValue="empty";}
        widget.onChanged(newValue);

      },
      items: widget.itemsList
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style: TextStyle(color: Colors.indigo),),
        );
      }).toList(),
    );
  }

}