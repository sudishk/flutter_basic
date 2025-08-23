class TestCty {
  List<City>? data;
  bool? status;
  String? message;


  TestCty(this.data,this.status, this.message);
  static TestCty jsonToModel(Map<String, dynamic> data){
    List<dynamic> cityList =data["data"];
    var cityModelList = cityList.map((e) => City.jsonToModel(e),).toList();
    return TestCty(cityModelList, data["status"], data["message"]);
  }
}

class City{
  String? id;
  String? location;
  City(this.id,this.location);
  static City jsonToModel(Map<String, dynamic> data){
    return City(data["id"], data["location"]);
  }
}