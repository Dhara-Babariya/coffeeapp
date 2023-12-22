import 'package:coffeeapp/Activities/showFavourite.dart';
import 'package:coffeeapp/Provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  List<int> selectedItems = [];
  @override
  Widget build(BuildContext context) {

    final favouriteProvider = Provider.of<FavouriteItem>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'favourite items'
        ),
        actions: [
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ShowFavouriteItem()));
          },
          child: Icon(Icons.favorite)),
        ],
      ),
      body: Column(
        children: [
              // Expanded(
                // child: ListView.builder(
                //     itemCount: 100,
                //     itemBuilder: (context,index){
                //       return Consumer<FavouriteItem>(builder: (context,value,child){
                //         return ListTile(
                //           onTap: (){
                //             if(value.selectedItems.contains(index)){
                //                  value.removeItem(index);
                //             }else{
                //               value.addItem(index);
                //             }
                //
                //             setState(() {
                //
                //             });
                //           },
                //           title: Text('Item' +index.toString()),
                //           trailing: Icon(value.selectedItems.contains(index) ? Icons.favorite :Icons.favorite_border_outlined),
                //         );
                //       });
                //
                // }),
              // )
        ],
      ),
    );
  }
}
