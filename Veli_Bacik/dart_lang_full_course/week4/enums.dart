void main() {
  final customerMouse = Mouses.a4;
  print(customerMouse.index);

  if(customerMouse == Mouses.a4) {}

  if (customerMouse.isCheckName('a4')) {
    print('aa');
  } else {
    print("yok");
  }
}

// value(değer) tutar.
enum Mouses {
  magic,
  apple,
  logitecth,
  a4
}

extension MousesSelectedExtension on Mouses {
  bool isCheckName(String name) {
    return this.name == name;
  }
}