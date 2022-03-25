import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/product_data.dart';
import '../Widgets/user_product_item.dart';
import './edit_product_screen.dart';

class UserProductScreen extends StatefulWidget {

  static const routeName = '/product-screen';

  @override
  State<UserProductScreen> createState() => _UserProductScreenState();
}

class _UserProductScreenState extends State<UserProductScreen> {

  @override
  void didChangeDependencies() {
    try {
      Provider.of<ProductProvider>(context).fetchData();
    } catch (error) {
      //print(error);
      throw error;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    final productsData = Provider.of<ProductProvider>(context);

    Future<void> _refreshProduct(BuildContext ctx) async {
      await Provider.of<ProductProvider>(ctx).fetchData();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your product'),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed(EditProductScreen.routeName);
          }, icon: const Icon(Icons.add),),
        ],
      ),
      drawer: const Drawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProduct(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
              value: productsData.items[index],
              child: Column(
                  children: [
                    UserProductItem(
                      productsData.items[index].id,
                      productsData.items[index].title,
                      productsData.items[index].imageUrl,
                    ),
                    const Divider(),
                  ],
                ),
            ),
            )
          ),
        ),
    );
  }
}
