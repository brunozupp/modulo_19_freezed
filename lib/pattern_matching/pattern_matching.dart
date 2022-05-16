import 'package:freezed_annotation/freezed_annotation.dart';

part 'pattern_matching.freezed.dart';

@freezed
class Union with _$Union {

  factory Union(int value) = UnionData;
  factory Union.loading() = UnionLoading;
  factory Union.error([String? message]) = UnionError;
}

void main(List<String> args) {
  
  var union = Union(1);

  /**
   * Patterns Matching:
   * when
   * maybeWhen
   * map
   * maybeMap
   */

  // Tratativas de todos os estados possíveis do Union
  var mensagem = union.when<String>(
    (value) => "Union Data Implementado $value", 
    loading: () => "Loading Implementado", 
    error: (String? error) => "Erro implementado $error"
  );

  print(mensagem);

  // Trás a possibilidade de eu implementar somente um dos estados
  var mensagemMaybe = union.maybeWhen(
    null, // esse cara é do construtor padrão (não nomeado) que o Union possui
    loading: () => "Loading implementando",
    orElse: () => "Padrão implementado",
  );

  print(mensagemMaybe);

  // A diferença desse para o when, é que no when ele trás os atributos desconstruidos.
  // Já no map eu recebo o atributo como a classe em si
  var mensagemMap = union.map(
    (value) => '${value.runtimeType} implementado', 
    loading: (loading) => '${loading.runtimeType} implementado', 
    error: (error) => '${error.runtimeType} implementado',
  );

  print(mensagemMap);

  // A diferença desse para o maybeWhen, é que no when ele trás os atributos desconstruidos.
  // Já no maybeMap eu recebo o atributo como a classe em si
  var mensagemMaybeMap = union.maybeMap(
    (value) => '${value.runtimeType} implementado', 
    orElse: () => 'Nada bateu com o que foi implementado',
  );

  print(mensagemMaybeMap);
}