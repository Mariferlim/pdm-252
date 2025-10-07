// Agregação e Composição
import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  String get nome => _nome;

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  String get nome => _nome;
  
  List<Dependente> get dependentes => _dependentes;

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'dependentes': _dependentes.map((d) => d.toJson()).toList(), 
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios; 

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  String get nomeProjeto => _nomeProjeto;
  
  List<Funcionario> get funcionarios => _funcionarios;

  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
    };
  }
}

void main() {
  Dependente dep1 = Dependente("Larissa Sales");
  Dependente dep2 = Dependente("Lucas Rios");
  Dependente dep3 = Dependente("Bia Andrade");
  Dependente dep4 = Dependente("Vitoria Fernandes");

  Funcionario func1 = Funcionario("Carlos Silva", [dep1, dep2]);
  Funcionario func2 = Funcionario("Helena Costa", [dep3, dep4]);
  Funcionario func3 = Funcionario("Roberto Santos", []); 

  List<Funcionario> listaFuncionarios = [func1, func2, func3];

  EquipeProjeto projeto = EquipeProjeto("Projeto Alpha", listaFuncionarios);

  Map<String, dynamic> projetoMap = projeto.toJson();
  
 
  String projetoJson = const JsonEncoder.withIndent('  ').convert(projetoMap);

  print("--- Objeto EquipeProjeto em formato JSON (Nomes Atualizados) ---");
  print(projetoJson);
}



