void main() {
  // || İki koşuldan biri sağlanıyorsa çalışır.(OR(VEYA))
  // && Her iki koşulda sağlanırsa çalışır.(AND(VE))
  int a = 40;
  int b = 50;

  int x = 90;
  int y = 80;

  print("a == b : ${a==b}");
  print("a != b : ${a!=b}");
  print("a > b : ${a>b}");
  print("a < b : ${a<b}");
  print("a >= b : ${a>=b}");
  print("a <= b : ${a<=b}");
  print("a > b || x > y : ${a > b || x > y}");
  print("a > b || x < y : ${a > b || x < y}");
  print("a > b && x > y : ${a > b && x > y}");
}