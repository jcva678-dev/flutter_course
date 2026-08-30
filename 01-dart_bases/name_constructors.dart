void main() {
  
  final Map<String, dynamic> rawJson = {
    'name': 'Tony Stark',
    'power': 'Money',
    'isAlive': true
  };
    
final ironman = Hero.fromJson( rawJson );
  
//   final ironman = Hero(
//     isAlive: false,
//     power: 'Money',
//     name: 'Tony Stark'
//   );
  
  
  print( ironman );
  
}

class Hero {
  
  String name;
  String power;
  bool isAlive;
  
  Hero({
    required this.name,
    required this.power,
    required this.isAlive
  });
  
  // constructor especializado el cual puede ser nombrado para ser usado directamente
  Hero.fromJson( Map<String,dynamic> json )
    // Dart es case sensitive por eso se acostumbra a valorar si el parametro no existe
     : name = json['name'] ?? 'No name found',
       power = json['power'] ?? 'No power found',
       isAlive = json['isAlive'] ?? 'No isAlive found';
  
    Hero.fromJsonLong( Map<String,dynamic> json){
        name = json['name'] ?? 'No name found',
       power = json['power'] ?? 'No power found',
       isAlive = json['isAlive'] ?? 'No isAlive found';
    }

  
  @override
  String toString() {
    return '$name, $power, isAlive: ${ isAlive ? 'YES!':'Nope' }';
  }

}