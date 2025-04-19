import 'dart:math';

void main() {
var random = Random();
int n1 = random.nextInt(101);
int n2 = random.nextInt(101);

//printa n1 e n2
print(n1);
print(n2);

//troca o valor de n1 por n2 e de n2 por n1
int n3 = n1;
n1 = n2;
n2 = n3;

//printa n1 e n2
print(n1);
print(n2);

}