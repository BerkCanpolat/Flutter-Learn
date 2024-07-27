class ServiceLearn {
  int? userId;
  int? id;
  String? title;
  String? body;

  ServiceLearn({this.userId, this.id, this.title, this.body});

  //jromJson => Data bize doğrudan map olarak geliyor ve bizim bu datayı cast yani listeye çevirmemiz gerek.
  //BURAYA KOD YAZILMAZ!
  ServiceLearn.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  //toJson => Dataları doldurtuktan sonra servise json formatında gönderebiliyoruz.
  //BURAYA KOD YAZILMAZ!
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
