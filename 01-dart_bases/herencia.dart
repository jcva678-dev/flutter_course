// Todo inicia con un void main
void main() {
  // instancio una clase WindPlant al no cambiar en tiempo de ejecucion la puedo inicializar como final
  final windPlant = WindPlant(initialEnergy: 100);
  final nuclearPlant = NuclearPlant(energyLeft: 1000);
  
  print(windPlant);
  
  print('wind: ${ chargePhone(windPlant)}');
  print('nuclear: ${ chargePhone(nuclearPlant)}');
}

double chargePhone( EnergyPlant plant){
  if(plant.energyLeft <10){
    throw Exception('Not enough energy');
  }
  return plant.energyLeft -10;
}

enum PlantType{nuclear, wind, water}

// clase abstracta estandar de POO con sus atributos y metodos propios
abstract class EnergyPlant{
  double energyLeft;
  final PlantType type;
  
  EnergyPlant({
    required this.energyLeft,
    required this.type
  });
    
    void consumeEnergy(double amount);
}

// WindPlant hereda de EnergyPlant.
// Debe implementar los miembros abstractos que no tengan implementación.
class WindPlant extends EnergyPlant{
  WindPlant({required double initialEnergy})
    :super(energyLeft: initialEnergy, type: PlantType.wind);
    
    @override
    void consumeEnergy(double amount){
      energyLeft -= amount;
    }
}

class NuclearPlant implements EnergyPlant{
  
  @override
  double energyLeft;
  @override
  final PlantType type =PlantType.nuclear;
  
  NuclearPlant({ required this.energyLeft});
  
  @override
  void consumeEnergy( double amount ){
    energyLeft -= (amount * 0.5);
  }
}

