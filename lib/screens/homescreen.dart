import 'package:demo_app/homeGrid.dart';
import 'package:demo_app/models/data.dart';
import 'package:demo_app/services/api_service.dart';
import 'package:demo_app/screens/swap.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Cart cart;
  bool isLoading = false;

  Future<void> apiCall() async {
    final value = await APIService.fetchData();
    setState(() {
      cart = value;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    apiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart App'),
        actions: [
          IconButton(icon: Icon(Icons.pages), onPressed: () => apiCall()),
          Container(
            child: FlatButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => Swap()),
              ),
              child: Text(
                'Next Screen',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: cart.productData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 5,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (ctx, index) {
                return Container(
                  child: HomeGrid(
                    imageUrl: cart.productData[index].defaultImage,
                    name: cart.productData[index].name,
                    price: cart.productData[index].price,
                    specialPrice: cart.productData[index].spclPrice,
                  ),
                );
              },
            ),
    );
  }
}
