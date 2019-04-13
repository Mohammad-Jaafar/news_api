
class Root {
  final String title;
  final String id;
  final String main_photo;
  final String date;
  final String text;
  final List<String> inner_photos;
  final String hits;

  Root._({this.title, this.id, this.main_photo, this.date, this.text,
    this.inner_photos, this.hits});




  factory Root.fromJson(Map<String, dynamic> json) {

    var photosFromJson  = json['inner_photos'];

    // List<String> photoList = new List<String>.from(photosFromJson);

    List<String> photoList = photosFromJson.cast<String>();

    return new Root._(
      title: json['title'],
      id:   json['id'],
      main_photo: json['main_photo'],
      date: json['date'],
      text: json['text'],
      inner_photos: photoList,
      hits: json['hits']
    );
  }
}