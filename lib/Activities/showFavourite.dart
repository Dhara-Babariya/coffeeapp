import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/favourite_provider.dart';

class ShowFavouriteItem extends StatefulWidget {
  const ShowFavouriteItem({super.key});

  @override
  State<ShowFavouriteItem> createState() => _ShowFavouriteItemState();
}

class _ShowFavouriteItemState extends State<ShowFavouriteItem> {
  @override
  Widget build(BuildContext context) {

    final favouriteProvider = Provider.of<FavouriteItem>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShowFavouriteItem()));
            },
                child: Icon(Icons.favorite)),
          ),
        ],
      ),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: ListView.builder(
      //           itemCount: favouriteProvider.selectedItems.length,
      //           itemBuilder: (context,index){
      //             return Consumer<FavouriteItem>(builder: (context,value,child){
      //               return ListTile(
      //                 onTap: (){
      //                   if(value.selectedItems.contains(index)){
      //                     value.removeItem(index);
      //                   }else{
      //                     value.addItem(index);
      //                   }
      //
      //                   setState(() {
      //
      //                   });
      //                 },
      //                 title: Text('Item' +index.toString()),
      //                 trailing: Icon(value.selectedItems.contains(index) ? Icons.favorite :Icons.favorite_border_outlined),
      //               );
      //             });
      //
      //           }),
      //     )
      //   ],
      // ),
    );
  }
}
