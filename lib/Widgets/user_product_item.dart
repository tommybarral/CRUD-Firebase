import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/product_data.dart';
import '../Screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;

  UserProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: id);
              }, icon: Icon(Icons.edit),),
              IconButton(onPressed: () {
                Provider.of<ProductProvider>(context, listen: false).deleteProduct(id);
              }, icon: Icon(Icons.delete),),
            ],
          ),
        )
    );
  }
}
