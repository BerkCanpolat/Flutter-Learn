void main() {

}

abstract class IStudent {
  final String name;
  final String age;
  int? schoolId;
  IStudent(this.name,this.age);

  void saySomething() {
    print(age);
  }
}



// IStudent'ı extend edersek abstract class ile Student farklı özelliklere sahip olabilir.
// Ama implement edersek hepsi IStuden'a sahip Istudent'ın birebir kopyalarıdır anlamına gelir. Hepsi interfacenin gücünü bire bir uygulamalıdır.
class Student implements IStudent{
  final String name;
  final String age;

  Student(this.name,this.age);
  
  @override
  void saySomething() {}
  
  @override
  int? schoolId;
}

class Student2 implements IStudent{
  final String name;
  final String age;

  Student2(this.name,this.age);
  
  @override
  void saySomething() {}
  
  @override
  int? schoolId;
}

