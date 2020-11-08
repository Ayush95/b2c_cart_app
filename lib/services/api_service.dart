import 'dart:convert';
import 'package:demo_app/models/data.dart';
import 'package:http/http.dart' as http;

class APIService {
  
  static Future<Cart> fetchData() async {
    print('Entered');
    final url = 'https://phaukat.com/api/product';

    var response = await http.post(
      url,
      body: json.encode({
        "fld_action_type": 0,
        "fld_brand_id": "0",
        "cart_total": 0,
        "fld_cat_id": 216,
        "fld_search_txt": "",
        "fld_total_page": 0,
        "fld_user_id": "159",
        "grid_list_view": 0,
        "fld_max_price": 0,
        "fld_min_price": 0,
        "next_page": 0,
        "fld_page_no": 0,
        "fld_pincode": 0,
        "fld_spcl_price": 0,
        "fld_product_price": 0,
        "fld_product_qty": 0,
        "shipping_total": 0,
        "statusCode": 0,
        "total_seller_count": 0
      }),
    );
    try {
      if (response.statusCode == 200) {
        final Cart cart = cartFromJson(response.body);
        return cart;
      } else {
        return Cart();
      }
    } catch (e) {
      print(e);
    }
  }
}
