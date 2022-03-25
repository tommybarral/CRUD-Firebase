import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/product_data.dart';
import '../Widgets/user_product_item.dart';
import './edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {

  static const routeName = '/product-screen';

  @override
  Widget build(BuildContext context) {

    final productsData = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your product'),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed(EditProductScreen.routeName);
          }, icon: Icon(Icons.add),),
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (ctx, index) => Column(
            children: [
              UserProductItem(
                productsData.items[index].id,
                productsData.items[index].title,
                productsData.items[index].imageUrl,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
