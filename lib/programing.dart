void main(){
  var edugaon  = {
    "status": 200,
    "message": "Success",
    "data" : {
      "faculties" : [
        {"name":"Ajay", "age":23}, {"name":"Suraj", "age":39},
        {"name":"Sudish", "age":24}],

      "students" :["Sonu", "Suraj", "Hena"]
    }
  };

  var jsonToModel = EdugaonModel.fromJsonToModel(edugaon);
  print(jsonToModel.apistatus);
  print(jsonToModel.message);
  print(jsonToModel.data?.faculties?[0].name);
/*  var data = edugaon["data"] as Map<String, dynamic>;
  var faculties = data["faculties"] as List<String>;
  var studentData = data["students"] as List<String>;
  print(studentData.length);

 */
}

class EdugaonModel{
  int? apistatus;
  String? message;
  DataModel? data;
  // EdugaonModel() //default constructor
  EdugaonModel(this.apistatus, this.message, this.data); // parameterise

 static EdugaonModel fromJsonToModel(Map<String, dynamic> data){
   var dataModel = DataModel.fromJsonToModel(data["data"]);
   return EdugaonModel(data["status"], data["message"], dataModel);
 }
}
class DataModel{
  List<FacutltyModel>? faculties;
  List<String>? students;
  DataModel(this.faculties, this.students);

 static DataModel fromJsonToModel(Map<String, dynamic> data){
   var faculties = data["faculties"] as List<dynamic>;
   var facultiesModel = faculties.map((e) => FacutltyModel.fromJsonToModel(e),).toList();
    return DataModel(facultiesModel, data["students"]);
  }
}

class FacutltyModel{
  String? name;
  int? age;
  FacutltyModel(this.name, this.age);

 static FacutltyModel fromJsonToModel (Map<String, dynamic> data){
    return FacutltyModel(data["name"], data["age"]);
  }

}
