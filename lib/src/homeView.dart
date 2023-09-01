import 'package:api_request_shop/src/controller/productController.dart';
import 'package:flutter/material.dart';

import 'repo/productRepo.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ProductController().getProduct(),
        builder: (context,snapshot){
          snapshot.data;
          if(snapshot.data==null){
            return const Center(child: CircularProgressIndicator(),);
          }

          final products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
              itemBuilder: (context,index){
                return Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(products[index].title,style: TextStyle(fontSize: 20),),
                      Text(products[index].description),
                    ],
                  ),
                );
              }
          );
        },
      ),
    );
  }
}
