import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Color sp = Color(0xFFFFAF00);
    return Scaffold(
      appBar: AppBar(
        leading: ImageIcon(AssetImage("assets/menu.png")),
        title: Image(
          image: AssetImage(
            "assets/splash.png",
          ),
          height: 34,
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.search),
          Gap(2),
          ImageIcon(AssetImage("assets/scan.png"), size: 18),
          Gap(10)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hi, Andrea",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "What are you looking for\ntoday?",
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),

            // NetworkImage(posterImg),
            Gap(10),
            Image(image: AssetImage('assets/addimage.png')),
            Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pictureTracker(true, sp),
                pictureTracker(false, sp),
                pictureTracker(false, sp),
                pictureTracker(false, sp),
              ],
            ),
            Gap(20),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Gap(10),
                  Text(
                    "Recommended",
                    style: TextStyle(fontSize: 12),
                  ),
                  Gap(10),
                  Column(
                    children: [
                      Text("Cell Phone", style: TextStyle(fontSize: 12)),
                      Container(
                        height: 5,
                        color: sp,
                      )
                    ],
                  ),
                  Gap(10),
                  Text("Car Products", style: TextStyle(fontSize: 12)),
                  Gap(10),
                  Text("Department Store", style: TextStyle(fontSize: 12)),
                  Gap(10),
                  Text("Computer", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            Align(
                alignment: AlignmentDirectional.topEnd,
                child: Text(
                  "See More  ",
                  style: TextStyle(fontSize: 12, color: sp),
                  textAlign: TextAlign.end,
                )),

            SizedBox(
              height: 185,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                children: [
                  categoryItem(
                      "assets/beauty.png", "Beauty", sp.withOpacity(0.2)),
                  categoryItem(
                      "assets/offers.png", "Offers", sp.withOpacity(0.2)),
                  categoryItem(
                      "assets/fashion.png", "Fashion", sp.withOpacity(0.2)),
                  categoryItem("assets/home.png", "Home", sp.withOpacity(0.2)),
                  categoryItem(
                      "assets/shirt.png", "Shirt", sp.withOpacity(0.2)),
                  categoryItem(
                      "assets/wbag.png", "Woman\n  Bag", sp.withOpacity(0.2)),
                  categoryItem(
                      "assets/dress.png", "Dress", sp.withOpacity(0.2)),
                  categoryItem(
                      "assets/mobiles.png", "Moblies", sp.withOpacity(0.2)),
                ],
              ),
            ),
Gap(20),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: getProductData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No products found"));
                } else {
                  // Display list of products in a horizontal row
                  var products = snapshot.data!;
                  return SizedBox(
                    height: 250, // Adjust height based on the content in fetchedContainer
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal, // Enables horizontal scrolling
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        var product = products[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add spacing between items
                          child: fetchedContainer(sp, product),
                        );
                      },
                    ),
                  );
                }
              },
            ),




          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 12,
          selectedFontSize: 12,
          selectedItemColor: sp,
          selectedLabelStyle: TextStyle(color: sp),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined), label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined), label: "Message"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: "Private"),
          ]),
    );
  }

  Future<List<Map<String, dynamic>>> getProductData() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    // Get all documents in the "product" collection
    QuerySnapshot querySnapshot = await _firestore.collection('product').get();

    // Map each document to a Map<String, dynamic> and return the list
    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }


  pictureTracker(bool bool, sp) {
    return Container(
      margin: EdgeInsets.all(2),
      height: bool ? 10 : 7,
      width: bool ? 10 : 7,
      decoration: BoxDecoration(
          color: bool ? sp : Colors.grey,
          borderRadius: BorderRadius.circular(5)),
    );
  }

  categoryItem(path, title, sp) {
    return Column(
      children: [
        Container(
          width: 47,
          height: 47,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: sp)),
          padding: EdgeInsets.all(3),
          child: Center(
            child: Image(image: AssetImage(path)),
          ),
        ),
        Gap(4),
        Text(
          title,
          style: TextStyle(fontSize: 10, color: Colors.grey),
        )
      ],
    );
  }

  fetchedContainer(sp, snapshot) {
    return SizedBox(
      width: 200,
      child: Stack(
        children: [
          Column(
            children: [
              Image(
                image: AssetImage('assets/onboarding1.png'),
                height: Get.width / 2.6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(snapshot['title']), Text(snapshot['price'].toString())],
                  ),
                  Container(
                    height: 20,
                    width: 60,
                    decoration: BoxDecoration(
                        color: sp, borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 16,
                        ),
                        Gap(4),
                        Text(
                          'Add',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),

                      ],
                    ),
                  ),Gap(2)
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: sp,
                        size: 14,
                      ),
                      Text(snapshot['rating']),
                    ],
                  ),
                  Spacer(),
                  Text('${snapshot['review']} Reviews'),
                  Gap(10),
                  ImageIcon(AssetImage("assets/dots.png"))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
