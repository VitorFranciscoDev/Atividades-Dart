//Tempo cronometrado: 07:17

void main() {
    //Declaração da lista
    List<int> numeros = [10, 35, 999, 126, 95, 7, 348, 462, 43, 109];

    //Chama os métodos
    forSoma(numeros);
    whileSoma(numeros);
    int soma = recursaoSoma(numeros, 0);
    print("recursão: $soma");
    metodoSoma(numeros);
}

//Soma os números da lista com base em um for
forSoma(List<int> numeros) {
    int soma=0;
    
    for(int i=0;i<numeros.length;i++) {
        soma+=numeros[i];
    }

    print("for: $soma");
}

//Soma os números da lista com base em um while
whileSoma(List<int> numeros) {
    int i=0;
    int soma=0;

    while(i<numeros.length) {
        soma+=numeros[i];
        i++;
    }

    print("while: $soma");
}

//Soma os números da lista com base em recursão
recursaoSoma(List<int> numeros, int i) {
    if(i>=numeros.length) {
        return 0;
    } else {
        return numeros[i] + recursaoSoma(numeros, i+1);
    }
}

//Soma os números da lista com base em um método de coleção
metodoSoma(List<int> numeros) {
    int soma = numeros.reduce((a, b) => a+b);
    print("lista: $soma");
}