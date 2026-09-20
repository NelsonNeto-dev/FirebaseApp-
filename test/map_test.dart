import 'package:flutter_test/flutter_test.dart';

// Cria um Map relacionando o nome do aluno às suas notas.
Map<String, List<double>> alunos = {
  'Maria': [8.0, 9.0],
  'Bruna': [7.0, 7.0],
  'Carla': [10.0, 9.0],
};

void main() {
  // Adiciona Elena somente se ela ainda não existir no Map.
  test('Adicionar elemento', () {
    alunos.putIfAbsent('Elena', () => [9.0, 8.0]);
    expect(alunos.containsKey('Elena'), isTrue);
    expect(alunos['Elena'], [9.0, 8.0]);
  });

  // Adiciona vários alunos e suas respectivas notas.
  test('Adicionar outro dicionário', () {
    alunos.addAll({
      'Elena': [9.0, 8.0],
      'Luiza': [8.0, 9.0],
    });

    expect(alunos.containsKey('Elena'), isTrue);
    expect(alunos.containsKey('Luiza'), isTrue);
  });

  // Remove uma aluna do Map utilizando sua chave.
  test('Remover elemento', () {
    alunos.remove('Bruna');
    expect(alunos.containsKey('Bruna'), isFalse);
  });

  // Atualiza as notas de Carla usando update e depois atribuição direta.
  test('Atualizar elemento', () {
    alunos.update('Carla', (value) => [9.0, 8.0]);
    expect(alunos['Carla'], [9.0, 8.0]);

    alunos['Carla'] = [8.0, 9.0];
    expect(alunos['Carla'], [8.0, 9.0]);
  });

  // Percorre todas as chaves e valores para calcular a soma das notas.
  test('Testar percorrer dicionário', () {
    expect(alunos.keys, ['Maria', 'Carla', 'Elena', 'Luiza']);

    expect(alunos.values, [
      [8.0, 9.0],
      [8.0, 9.0],
      [9.0, 8.0],
      [8.0, 9.0],
    ]);

    double soma = 0;

    // forEach percorre cada aluno e depois cada uma de suas notas.
    alunos.forEach((key, value) {
      for (double nota in value) {
        soma += nota;
      }
    });

    expect(soma, 68.0);
  });

  // Calcula a média das notas de cada aluno e armazena em outro Map.
  test('Calcular médias', () {
    Map<String, double> medias = {};

    alunos.forEach((nome, notas) {
      double soma = 0;

      // Soma todas as notas do aluno.
      for (double nota in notas) {
        soma += nota;
      }

      // Divide a soma pela quantidade de notas para obter a média.
      double media = soma / notas.length;
      medias[nome] = media;
    });

    expect(medias, {
      'Maria': 8.5,
      'Carla': 8.5,
      'Elena': 8.5,
      'Luiza': 8.5,
    });
  });
}
