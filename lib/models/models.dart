class DataModel{
  final String title;
  final String imageName;
  // final double price;
  DataModel(
    this.title,
    this.imageName,
    // this.price,
  );
}

List<DataModel> dataList=[
  DataModel("Rice", "assets/images/riceSack.jpg"),
  DataModel("Oil", "assets/images/oil.jpg"),
  DataModel("Soap", "assets/images/soap.jpg"),
  DataModel("Sugar", "assets/images/sugar.jpg"),
];