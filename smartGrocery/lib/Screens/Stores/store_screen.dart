import 'package:flutter/material.dart';
// Comment
class Storescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Local Stores'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: <Widget>[
          Spacer(),
          StoreCard(
            imagePath: 'assets/images/Target.png',
            storeName: 'Target',
            address: "1101 W Jackson Blvd, Chicago, IL 60607",

          ),
          StoreCard(
            imagePath: 'assets/images/JewelOsco.png',
            storeName: 'Jewel-Osco',
            address: "1220 S Ashland Ave, Chicago, IL 60608",
          ),
          StoreCard(
            imagePath: 'assets/images/marianos.png',
            storeName: 'Mariano\'s',
            address: "1615 S Clark St, Chicago, IL 60616",
          ),
          StoreCard(
            imagePath: 'assets/images/aldi.png',
            storeName: 'ALDI',
            address: "1739 W Cermak Rd, Chicago, IL 60608",
          ),
          StoreCard(
            imagePath: 'assets/images/wholefood.png',
            storeName: 'Whole Foods',
            address: "1101 S Canal St Ste 107, Chicago, IL 60607",
          ),
          StoreCard(
            imagePath: 'assets/images/hmart.png',
            storeName: 'Hmart',
            address: "711 W Jackson Blvd, Chicago, IL 60661",
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class StoreCard extends StatelessWidget {
  final String imagePath;
  final String storeName;
  final String address;

  const StoreCard({
    required this.imagePath,
    required this.storeName,
    required this.address,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // GestureDetector widget to have opTap property
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              content: SizedBox(
                height: 80,
                child: Stack(
                  children: [
                    Text(
                      "You clicked on ${storeName}",
                      style: TextStyle(fontSize: 16),),
                    Positioned(
                        bottom: 0,
                        right: 5,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "OK",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                ),
              )
          );
        });
      },
      child: Card(
          margin: EdgeInsets.all(16),
          color: Colors.white60,
          elevation: 4,
          // Stack widget to set position easily
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(30), // Set the desired width
                  child: Image.asset(
                    width: 150,
                    height: 145,
                    imagePath,
                    fit: BoxFit.fill,
                  ),
                ),),
              Positioned(
                top: 5,
                left: 160,
                child:
                Text(
                  storeName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

              ),
              Positioned(
                  top: 40,
                  left: 160,
                  child: Column(
                    children: [
                      SizedBox(
                          width: 200,
                          child: Text(
                              maxLines: 2,
                              address,
                              style: TextStyle(fontSize: 15)
                          )
                      )
                    ],
                  )),
              Positioned(
                  right: 15,
                  bottom: 5,
                  child: Row(
                    children: [favorite()],
                  ))
            ],
          )

      ),
    );
  }
}


// favorite return thump up and thump down icon buttons
class favorite extends StatefulWidget {
  const favorite({super.key});

  @override
  State<favorite> createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  // keep track of time pressed
  int counter = 0;
  int counter2 = 0;
  bool isSelected = false;
  bool isSelected2 = false;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            icon: Icon(
              Icons.thumb_up,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            onPressed: (){
              setState(() {
                isSelected = true;
                counter = counter + 1;
              });
            }
        ),
        Text("${counter}"),
        IconButton(
            icon: Icon(
              Icons.thumb_down,
              color: isSelected2 ? Colors.red : Colors.grey,
            ),
            onPressed: (){
              setState(() {
                isSelected2 = true;
                counter2 = counter2 + 1 ;
              });
            }
        ),
        Text("${counter2}")
      ],
    );
  }
}

// class StoreCard extends StatelessWidget {
//   final String imagePath;
//   final String storeName;
//   final String rating;
//   final String distance;
//
//   const StoreCard({
//     required this.imagePath,
//     required this.storeName,
//     required this.rating,
//     required this.distance,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Card(
//         color: Colors.white60,
//         elevation: 4,
//         child: Row(
//           children: [
//             Container(
//               width: 120.0,
//               height: 100,// Set the desired width
//               child: Image.asset(
//
//                 imagePath,
//                 fit: BoxFit.contain,
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       storeName,
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     Row(
//                       children: [Icon(
//                         Icons.star,
//                         color: Colors.yellow,
//                       ),
//                       SizedBox(width: 10),
//                       Text(
//                         rating,
//                         style: TextStyle(fontSize: 16),
//                       )],
//                     ),
//
//                     Text(distance, style: TextStyle(fontSize: 16)),
//                   ],
//                 ),
//               ),
//             ),
//
//           ]
//
//     )
//       ),
//     );
//   }
// }
