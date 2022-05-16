import 'package:freezed_annotation/freezed_annotation.dart';

part 'unions.freezed.dart';

@freezed
class Example with _$Example {

  const factory Example.person(String name, int age) = Person;

  const factory Example.city(String name, int population) = City;
}

void main(List<String> args) {
  
  var example = Example.person('Rodrigo', 38);

  // Não é permitido fazer isso pois não possui apenas uma única classe em Example (Person e City)
  //print(example.age);

  // Só é permitido acessar um atributo se em todas as classes de Example possuir o mesmo
  print(example.name);

  // Para pegar atributos diferentes, eu posso fazer a verificação de tipo
  if(example is Person) {
    example.age;
  }

  // Pattern Matching = formas de acessar atributos de uma classe
} 