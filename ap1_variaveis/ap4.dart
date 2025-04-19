import 'dart:math';

void main() {
var random = Random();
int v1 = random.nextInt(99)+1;
int v2 = random.nextInt(99)+1;

//divisao de v1 por v2
double resultado = v1/v2;

//atribui a parte inteira de resultado pro v3 e a parte decimal pro v4
int v3 = resultado.toInt();
double v4 = resultado-v3;

//printa todas as variaveis
print('''
Primeiro valor: $v1
Segundo valor: $v2
Resultado da divisão: $resultado
Parte inteira do resultado: $v3
Parte decimal do resultado: $v4
''');
}