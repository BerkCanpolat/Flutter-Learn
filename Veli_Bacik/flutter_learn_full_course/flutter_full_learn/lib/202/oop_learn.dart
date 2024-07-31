// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter_full_learn/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class IFileDownload{
  bool? downloadItem(FileItem? fileItem);
  void toShare(String path) async{
    await launchUrlString(path);
  }
}





//GENERİC (T)
class FileDownload<T> extends IFileDownload with ShareMixin{
  @override
  bool? downloadItem(FileItem? fileItem) {
    if(fileItem == null) throw FileDownloadException();

    print('a');

    return true;
  }
  
  @override
  void toShare(String path) {
    // TODO: implement toShare
  }
  
  @override
  void share() {
    // TODO: implement share
  }
}


class FileItem {
  final String name;
  final File file;
  FileItem({
    required this.name,
    required this.file,
  });
}


//Abstract class gibi çalışır bundan türeyenlere bu güçleri kazandırır.
//İçini doldurmadan kullanılabilir.
//On => Belli durumlarda türe(IFileDownloaddan türeyenlere kazandır bu gücü) Anlamı taşır.
//On => Sınırlandırmış oluyoruz.
mixin ShareMixin on IFileDownload{
  void share();
  void toShowFile() {
    
  }
}