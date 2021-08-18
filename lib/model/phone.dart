class Phone {
  int id;
  String name;
  String brand;
  String imageUrl;

  Phone.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        brand = json['Brand'],
        imageUrl = json['image_url'];

  Map toJson() {
    return {'id': id, 'name': name, 'Brand': brand, 'image_url': imageUrl};
  }
}
