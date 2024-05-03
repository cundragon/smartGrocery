import 'package:flutter/material.dart';
import 'package:smartGrocery/Screens/Homescreen/homescreen.dart';
import 'package:smartGrocery/Screens/Signup/signup_screen.dart';

class MultiSelect extends StatefulWidget {
  final List<String> options;
  const MultiSelect({Key? key, required this.options}) : super(key:key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  final List<String> _selectedOptions = [];

  void _optionChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedOptions.add(itemValue);
      } else {
        _selectedOptions.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedOptions);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select One or More Options'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.options
              .map((item) => CheckboxListTile(
            value: _selectedOptions.contains(item),
            title: Text(item),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (isChecked) => _optionChange(item, isChecked!),
          ))
              .toList(),
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: _submit,
            child: const Text('Submit'),
            style: ElevatedButton.styleFrom(

                backgroundColor: Colors.green,
                elevation: 0)
        ),

        const SizedBox(height: 16),
        ElevatedButton(
            onPressed: _cancel,
            child: const Text('Cancel'),
            style: ElevatedButton.styleFrom(

                backgroundColor: Color(0xFFDCEDC08),
                elevation: 0)
        ),
      ],
    );
  }
}



class preferences extends StatefulWidget {
  const preferences({super.key});

  @override
  State<preferences> createState() => _preferencesState();
}

class _preferencesState extends State<preferences> {
  List<String> dietOptions = [
    "Gluten free and coeliac",
    "Dairy free and lactose free" ,
    "Vegetarian",
    "Vegan",
    "Paleo",
    "FODMAP",
    "Tree nut and peanut allergies",
    "Fish and shellfish allergies",
    "The Ketogenic diet",
  ];
  List<String> selectedDiet = [];

  List<String> allergyOptions = [
    "Peanut",
    "Egg",
    "Milk",
    "Shellfish",
    "Fish",
    "Tree nut",
    "Soy",
    "Wheat",
    "Walnut",
    "Almond",
    "Lobster",
    "Soybean",

  ];
  List<String> selectedAllergy = [];

  List<String> regionOptions = [
    "Asian",
    "Italian",
    "Mexican",
    "American"
  ];
  List<String> selectedRegion = [];

  void _showMultiSelect(List<String> items, int i) async {
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(options: items);
      },
    );
    if (i == 1) {
      if (results != null) {
        setState(() {
          selectedDiet = results;
        });
      }
    } else if (i == 2) {
      if (results != null) {
        setState(() {
          selectedAllergy = results;
        });
      }
    } else {
      if (results != null) {
        setState(() {
          selectedRegion = results;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
            children: [
              Text(
                "PREFERENCES".toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DelaGothicOne',
                    color: Colors.white,
                    fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    ListTile(

                      leading:
                      const Icon(Icons.abc_rounded, color: Colors.white, size: 40), // ListTile Icons
                      title: const Text(
                        'Enter Dietary Requirements',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 40),
                      onTap: () => _showMultiSelect(dietOptions, 1),
                      selected: true,
                      enabled: true,
                      shape: const StadiumBorder(
                          side: BorderSide(width: 1, color: Colors.black)
                      ),
                    ),
                    Wrap(
                        spacing: 10,
                        children: selectedDiet.map((e) => Chip(label: Text(e),)).toList()
                    ),
                    SizedBox(height: 40),
                    ListTile(

                      leading:
                      const Icon(Icons.abc_rounded, color: Colors.white, size: 40), // ListTile Icons
                      title: const Text(
                        'Enter Allergies You Might Have',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 40),
                      onTap: () => _showMultiSelect(allergyOptions, 2),
                      selected: true,
                      enabled: true,
                      shape: const StadiumBorder(
                          side: BorderSide(width: 1, color: Colors.black)
                      ),
                    ),
                    Wrap(
                        spacing: 10,
                        children: selectedAllergy.map((e) => Chip(label: Text(e),)).toList()
                    ),
                    SizedBox(height: 40),
                    ListTile(

                      leading:
                      const Icon(Icons.abc_rounded, color: Colors.white, size: 40), // ListTile Icons
                      title: const Text(
                        'Enter Cuisine Preferences',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 40),
                      onTap: () => _showMultiSelect(regionOptions, 3),
                      selected: true,
                      enabled: true,
                      shape: const StadiumBorder(
                          side: BorderSide(width: 1, color: Colors.black)
                      ),
                    ),
                    Wrap(
                      spacing: 10,
                      children:
                      selectedRegion.map((e) => Chip(label: Text(e),)).toList(),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30,),
              Padding(padding: EdgeInsets.all(50),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      },
                      child: const Text('FINISH'),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.lightGreen,
                        shape: const StadiumBorder(),
                        maximumSize: const Size(double.infinity, 56),
                        minimumSize: const Size(double.infinity, 56),
                      ),),

                    const SizedBox(height: 16),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) {
                    //             return SignUpScreen();
                    //           },
                    //         ),
                    //       );
                    //     },
                    //     child: const Text('BACK'),
                    //     style: ElevatedButton.styleFrom(
                    //
                    //         backgroundColor: Color(0xFFDCEDC08),
                    //         elevation: 0)
                    // ),
                  ],
                ),)

            ]),
      )
    );
  }
}

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    this.topImage = "assets/images/main_top.png",
    this.bottomImage = "assets/images/login_bottom.png",
  }) : super(key: key);

  final String topImage, bottomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                topImage,
                width: 120,
              ),
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}

