void main() {
  //Objeto da classe Gato
  Gato gato = Gato();

  //Chama as funções
  gato.beber();
  gato.comer();
  gato.miar();
}

//Classe abstrata que possui os métodos que serão herdados por Gato
abstract class Animal {
    void comer();
    void beber();
}

class Gato extends Animal {
    //Funções que printam a atividade do animal
    void beber() {
        print("O animal esta bebendo.");
    }
    void comer() {
        print("O animal esta comendo.");
    }
    void miar() {
        print("O gato esta miando.");
    }
}