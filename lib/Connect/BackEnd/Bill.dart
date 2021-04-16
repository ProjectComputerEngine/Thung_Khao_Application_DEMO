class Bill {
final String id;
final String name;
final String num;
final String price;
final String imageURL;
final String ID_Shop;
Bill({this.ID_Shop, this.imageURL, this.id, this.name, this.num, this.price});
Map toJson() => {
  'id': id,
  'name': name,
  'num': num,
  'price': price,
  'imageURL': imageURL,
};
}