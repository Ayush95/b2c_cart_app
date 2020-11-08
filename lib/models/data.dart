import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

class Cart {
    Cart({
        this.productData,
    });

    List<ProductDatum> productData;

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        productData: List<ProductDatum>.from(json["product_data"].map((x) => ProductDatum.fromJson(x))),
    );
}

class ProductDatum {
    ProductDatum({
        this.id,
        this.extraPrice,
        this.name,
        this.price,
        this.spclPrice,
        this.defaultImage,
    });

    int id;
    int extraPrice;
    String name;
    int price;
    int spclPrice;
    String defaultImage;

    factory ProductDatum.fromJson(Map<String, dynamic> json) => ProductDatum(
        id: json["id"],
        extraPrice: json["extra_price"],
        name: json["name"],
        price: json["price"],
        spclPrice: json["spcl_price"],
        defaultImage: json["default_image"],
    );
}
