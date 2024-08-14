extension ColorStringExtension on String? {
  //Çağrıldığında bu değer hesaplanacak(Compited)
  int get colorValue {
    //# gördüğünde bunu 0xff'e çevir.
    var _newColor = this?.replaceFirst('#', '0xff') ?? '';
    return int.parse(_newColor);
  }
}
