//Tempo cronometrado: 5:37

void main() {
  //Declaração das listas
  List<double> temperaturas = [0.0, 4.2, 15.0, 18.1, 21.7, 32.0, 40.0, 41.0];
  List<double> fahs = [];
  List<double> kelvins = [];

  //for para calcular as temperaturas em Fahrenheit e Kelvin e adiciona-las em listas
  for(var temperatura in temperaturas) {
    fahs.add(transformarEmFahrenheit(temperatura));
    kelvins.add(transformarEmKelvin(temperatura));
  }

  //for para printar as temperaturas em Fahrenheit e Kelvin
  for(int i=0;i<temperaturas.length;i++) {
    print("Celcius: ${temperaturas[i].toStringAsFixed(2)}, fahrenheit: ${fahs[i].toStringAsFixed(2)}, kelvin: ${kelvins[i].toStringAsFixed(2)}");
  }
}

//Função para transformar Celsius em Fahrenheit
transformarEmFahrenheit(double temp) {
  double fah = (temp*1.8) + 32;
  return fah;
}

//Função para transformar Celsius em Kelvin
transformarEmKelvin(double temp) {
  double kelvin = temp + 273.15;
  return kelvin;
}