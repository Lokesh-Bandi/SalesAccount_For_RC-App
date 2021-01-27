import 'package:flutter/material.dart';
import 'package:e_commerce/ProductDetails.dart';
// ignore: must_be_immutable
class DisplayCard extends StatelessWidget {
  String productName;
  String offeredBy;
  int price;
  double offer;
  double oldPrice;
  int rating;
  String imageUrl;
  List<String> reviews;

  DisplayCard(
      {Key key,
        this.productName,
        this.offeredBy,
        this.price,
        this.offer,
        this.oldPrice,
        this.rating,
        this.imageUrl,
        this.reviews})
      : super(key: key);

  String ratingFunction(int rating) {
    String full = "★";
    String empty = "☆";
    String result = "";
    int i;
    for (i = 1; i <= rating; i++) {
      result = result + full;
    }
    if (i <=5) {
      for (i = rating + 1; i <= 5; i++) {
        result = result + empty;
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return ProductDetails();
        }));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(3, 5, 3, 5),
        height: 320,
        width: double.maxFinite,
        child: Card(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Wrap(children: [
                      Text(
                        productName,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        //width: 250,
                        child: Image(
                          fit: BoxFit.contain,
                          image: NetworkImage(imageUrl),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: double.maxFinite,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "By "+offeredBy,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "₹$price",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:5.0,horizontal: 1),
                              child: Text(
                                "OFFER $offer%",
                                style: TextStyle(
                                    fontSize: 13,
                                    decoration: TextDecoration.underline,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:5.0,horizontal: 1),
                              child: Text(
                                "₹$oldPrice",
                                style: TextStyle(
                                    fontSize: 13,
                                    decoration:
                                    TextDecoration.lineThrough,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                ratingFunction(rating),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Reviews",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          elevation: 15,
        ),
      ),
    );
  }
}