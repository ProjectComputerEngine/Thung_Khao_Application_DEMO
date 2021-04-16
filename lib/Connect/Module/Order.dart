class Order {
  final String ID;
  final String Name;
  final String Status;
  final String Image_URL;
  final String Date;

  Order({this.ID, this.Name, this.Status, this.Image_URL, this.Date});
  // Map toJson() => {
  //   'ID': ID,
  //   'Name': Name,
  //   'Status': Status,
  //   'Image_URL': Image_URL,
  //   'Date': Date,
  // };
}
