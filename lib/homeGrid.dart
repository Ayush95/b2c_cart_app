import 'package:flutter/material.dart';

class HomeGrid extends StatefulWidget {
  final String imageUrl;
  final String name;
  final int price;
  final int specialPrice;

  const HomeGrid({
    Key key,
    this.imageUrl,
    this.name,
    this.price,
    this.specialPrice,
  }) : super(key: key);

  @override
  _HomeGridState createState() => _HomeGridState();
}

class _HomeGridState extends State<HomeGrid> {
  bool favoriteSelected = false;
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        child: Card(
          elevation: 4.0,
          child: Image(
            image: NetworkImage(
              widget.imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      footer: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(
                      () {
                        favoriteSelected = !favoriteSelected;
                      },
                    );
                  },
                  icon: favoriteSelected == true
                      ? Icon(Icons.favorite, color: Colors.red)
                      : Icon(Icons.favorite_border),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '₹' +'${widget.specialPrice.toString()}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '₹' +'${widget.price.toString()}',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Text(
                  '-98% off',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                )
              ],
            ),
            const SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}
