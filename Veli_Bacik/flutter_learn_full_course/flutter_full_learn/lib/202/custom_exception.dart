//İmplements => Bir classtan bir başka class'ı copy etmek. Yani bütün methodlarını almak.
//Extension => Bir üst sınıfın bütün özelliklerini alacak ve tekrar edecek. İçi verilmemiş olanları biz doldururuz.
//Extension genel olarak o sınıfın özelliklerini alıp üzerine kendi özelliklerimizi katıcaz.
class FileDownloadException implements Exception{
  @override
  String toString() {
    // TODO: implement toString
    return 'File Download Has Failed';
  }
}