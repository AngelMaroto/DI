
import 'dart:io';

Future<void> main() async{
  
  var fichero = File('texto.txt');
  var directorio = fichero.parent;

  directorio.watch().listen((evento){
    switch(evento.type){
      case FileSystemEvent.create:
      print("El fichero ha sido creado ${evento.path}");
      break;
      case FileSystemEvent.delete:
      print("El fichero ha sido borrado ${evento.path}");
      break;
      case FileSystemEvent.modify:
      print("El fichero ha sido modificado ${evento.path}");
      break;
      default:
      print("ha ocurrido algo ${evento.path}");
      break;
    }
    if(evento.type == FileSystemEvent){
      print("El fichero ha sido modificado : ${evento.path}");
    }
  }
  );

  print("probando cambios");

  //var contenido = await fichero.readAsString();
  //print("el archivo tiene ${contenido.length} caracteres");
  /*
  Stream<String> lineas = fichero.openRead()
  .transform(utf8.decoder)
  .transform(LineSplitter());

  lineas.listen((linea){
    print("Procesando línea: ${linea}");
  }, 
  onError: (e) => print("Ocurrio un eror : $e"),
  onDone: () => print("Lectura de archivo completa"),
  );*/
}
