import 'package:actividades3/actividades3.dart' as actividades3;


//funcion sumar edades(parametro mapa retorno int)
int sumaedad(Map<String, int> mapa) {
  int suma =0;

    for(int edad in mapa.values)
    {suma += edad;};
    return suma;
}
//funcion edad minima(parametro mapa retorno int)
int maximaedad (Map<String, int> mapa){
    int maxima = mapa.values.first ;

     for(int edad in mapa.values){
      if(edad > maxima){
        maxima = edad;
      }
    }

    return maxima;
}
//funciion edad maxima(parametro mapa retorno int)
int minimaedad (Map<String, int> mapa){
    
    int minima =mapa.values.first;
    for(int edad in mapa.values){
      if(edad < minima){
        minima = edad;
      }
    }

    return minima;
}
void main(List<String> arguments) {
  
  //definir mapa(nombre - edad)
  Map<String, int> edad = {"Juan":20, "Messi":30};
  //lamada a funciones con print
  print("La suma de las edades es ${sumaedad(edad)}");
  print("La edadd minmima es ${minimaedad(edad)}");
  print("La edad maxima es ${maximaedad(edad)}");

}
