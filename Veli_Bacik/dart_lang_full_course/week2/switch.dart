void main() {
  final int classDegree = 2;
  bool isSucess = false;
  const int succesValueHigh = 2;

  // 2 ise ekrana bravo
  // 1 ise olur
  // 0 ise güzel
  // diğer durumlarda başarısız

  switch(classDegree) {
    case succesValueHigh:
    print("Bravo");
    isSucess = true;
    break;
    case 1:
    print("Olur");
    isSucess = true;
    break;
    case 0:
    print("güzel");
    isSucess = true;
    break;
    default:
    print('Başarısız');
    isSucess = false;
  }

  print('Beyefendi çocuğunuzun sonucu: $isSucess');

  // Mağazaya gelen isimlerden berk olursa bravoo yaz
  // Ekin
  String name = 'Berk';

  const String specialUser1 = "Berk";
  const String specialUser2 = "Ekin";

  switch(name) {
    case "Berk":
    case "Ekin":
    print("Bravoo");
    break;
    default:
    print("Sorunlu");
  }

  switch(name) {
    case specialUser1:
    case specialUser2:
    print("Bravoo");
    break;
    default:
    print("Sorunlu");
  }
}