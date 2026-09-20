import 'package:flutter_test/flutter_test.dart';

// Cria uma lista de números inteiros para realizar os testes.
List<int> numeros = [1, 2, 3];

void main() {
  // Adiciona o número 4 ao final da lista.
  test('Adicionar elemento', () {
    numeros.add(4);
    expect(numeros.contains(4), isTrue);
  });

  // Adiciona vários elementos de uma vez usando outra lista.
  test('Adicionar outra lista', () {
    numeros.addAll([5, 6]);
    expect(numeros.contains(5), isTrue);
    expect(numeros.contains(6), isTrue);
  });

  // Insere o número 0 na posição inicial da lista.
  test('Adicionar na posição', () {
    numeros.insert(0, 0);
    expect(numeros.indexOf(0), 0);
  });

  // Remove o número 2 pelo seu valor.
  test('Remover elemento', () {
    numeros.remove(2);
    expect(numeros.contains(2), isFalse);
  });

  // Remove o elemento que está na posição 0 da lista.
  test('Remover na posição', () {
    numeros.removeAt(0);
    expect(numeros.contains(0), isFalse);
  });

  // Verifica quantos elementos existem atualmente na lista.
  test('Testar tamanho', () {
    expect(numeros.length, 5);
  });

  // Verifica se a lista está vazia ou possui elementos.
  test('Testar vazio e não vazio', () {
    expect(numeros.isEmpty, isFalse);
    expect(numeros.isNotEmpty, isTrue);
  });

  // Testa a inversão e a ordenação dos elementos da lista.
  test('Testar ordenação', () {
    expect(numeros.reversed.toList(), [6, 5, 4, 3, 1]);
    expect(numeros, [1, 3, 4, 5, 6]);

    numeros = numeros.reversed.toList();
    expect(numeros, [6, 5, 4, 3, 1]);

    numeros.sort();
    expect(numeros, [1, 3, 4, 5, 6]);
  });

  // Percorre a lista, soma os valores e aplica transformações.
  test('Testar percorrer lista', () {
    int soma = 0;

    // O for percorre cada número existente na lista.
    for (int numero in numeros) {
      soma += numero;
    }

    expect(soma, 19);

    // O map multiplica cada elemento por 2 e cria uma nova lista.
    numeros = numeros.map((numero) => numero * 2).toList();
    expect(numeros, [2, 6, 8, 10, 12]);

    // O where mantém apenas os números divisíveis por 3.
    numeros = numeros.where((numero) => numero % 3 == 0).toList();
    expect(numeros, [6, 12]);
  });
}
