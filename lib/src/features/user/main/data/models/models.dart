class DataModel {
  final String title;
  final String imageName;
  final double price;
  DataModel(
    this.title,
    this.imageName,
    this.price,
  );
}

List<DataModel> dataList = [
  DataModel("Rice", "assets/images/riceSack.jpg", 300.0),
  DataModel("Oil", "assets/images/oil.jpg", 200.0),
  DataModel("Soap", "assets/images/soap.jpg", 50.0),
  DataModel("Sugar", "assets/images/sugar.jpg", 100.0),
  DataModel("Salt", "assets/images/salt.jpg", 30.0),
  DataModel("Tea", "assets/images/tea.jpg", 250.0),
];
