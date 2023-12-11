import 'package:equatable/equatable.dart';

class ItemDetail extends Equatable  {
  final String image;
  final String name;
  final String price;
  final int id;

 const ItemDetail({
    required this.image,
    required this.name,
    required this.price,
    required this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [image,name,price,id];

  @override
  toString()=>'ItemDetail(id:$id, name: $name, image: $image, price: $price)';

}
