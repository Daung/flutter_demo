/// id : "m1"
/// categories : ["c1","c2"]
/// title : "番茄酱意大利面"
/// affordability : 0
/// complexity : 0
/// imageUrl : "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg"
/// duration : 20
/// ingredients : ["4个西红柿","一汤匙橄榄油","1个洋葱","250克意大利面","香料","奶酪（可选）"]
/// steps : ["把西红柿和洋葱切成小块。","烧开水煮沸后加盐。","把意大利面放进开水里，大约10到12分钟就可以做好。","同时加热一些橄榄油，加入切好的洋葱。","两分钟后，加入番茄片、盐、胡椒和其他香料。","一旦意大利面做好了，调味汁就会做好。","在成品盘上随意加些奶酪。"]
/// isGlutenFree : false
/// isVegan : true
/// isVegetarian : true
/// isLactoseFree : true

class WZMealModel {
  String id;
  List<String> categories;
  String title;
  int affordability;
  int complexity;
  String imageUrl;
  int duration;
  List<String> ingredients;
  List<String> steps;
  bool isGlutenFree;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;

  WZMealModel({
      this.id, 
      this.categories, 
      this.title, 
      this.affordability, 
      this.complexity, 
      this.imageUrl, 
      this.duration, 
      this.ingredients, 
      this.steps, 
      this.isGlutenFree, 
      this.isVegan, 
      this.isVegetarian, 
      this.isLactoseFree});

  WZMealModel.fromJson(dynamic json) {
    id = json["id"];
    categories = json["categories"] != null ? json["categories"].cast<String>() : [];
    title = json["title"];
    affordability = json["affordability"];
    complexity = json["complexity"];
    imageUrl = json["imageUrl"];
    duration = json["duration"];
    ingredients = json["ingredients"] != null ? json["ingredients"].cast<String>() : [];
    steps = json["steps"] != null ? json["steps"].cast<String>() : [];
    isGlutenFree = json["isGlutenFree"];
    isVegan = json["isVegan"];
    isVegetarian = json["isVegetarian"];
    isLactoseFree = json["isLactoseFree"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["categories"] = categories;
    map["title"] = title;
    map["affordability"] = affordability;
    map["complexity"] = complexity;
    map["imageUrl"] = imageUrl;
    map["duration"] = duration;
    map["ingredients"] = ingredients;
    map["steps"] = steps;
    map["isGlutenFree"] = isGlutenFree;
    map["isVegan"] = isVegan;
    map["isVegetarian"] = isVegetarian;
    map["isLactoseFree"] = isLactoseFree;
    return map;
  }

}