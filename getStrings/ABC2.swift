//
//  ABC2.swift
//  getStrings
//
//  Created by Mauricio Figueroa on 9/20/17.
//  Copyright © 2017 Mauricio Figueroa. All rights reserved.
//

import Foundation


public class ABC2 {
    

    static func select(uri: String, completion: @escaping ([String]) -> ())
    {
        var stringsArray = [String]()//Creamos arreglo de strings local para guardar los valores recuperados y poder regresarlos al ViewController
        let jsonUrlString = uri //Asignamos la URI de datos en json a una variable
        guard let url = URL(string:jsonUrlString) else {return} //Creamos objeto URL con la uri
        URLSession.shared.dataTask(with: url) { (data, response, err) in //Creamos dataTask de la URLSession
            guard let data = data else {return} //En data se guardan los bytes recuperados de la URI
            do {
                let decodedJson = try JSONDecoder().decode([Palabra].self, from: data) //Decodificamos los datos de "data"
                print("Imprimimos decodedJSon: ", decodedJson)
                for iterator in decodedJson {
                    stringsArray.append(iterator.string!) //Agregamos cada valor string de cada objeto al arreglo stringsArray
                }//end for
                completion(stringsArray) //Completion es llamado cuando el dataTask asincrono es completado, forma de regresar un valor sin utilizar return.
            }//end do
            catch let jsonErr {
                print("Error serializing json: ", jsonErr)
            }//end catch
            }//end URLSession
            .resume() //ranaudamos dataTask que por default inicia en un estado suspendido
    }
    
    static func insert (uri: String, parameter: String) {
        let request = NSMutableURLRequest(url: NSURL (string: uri)! as URL) //Creamos objeto NSMutableURLRequest con la uri
        request.httpMethod = "POST" //Llamamos metodo httpMethod POST
        let postString = "parameter=\(parameter)" //Asignamos el parametro con el que se ejecuta metodo POST
        request.httpBody = postString.data(using: String.Encoding.utf8) //Se llama metodo httpBody
        let task = URLSession.shared.dataTask(with: request as URLRequest) { //Creamos dataTask de la URLSession
            data, response, error in
            if error != nil {

                return
            }
        }
        task.resume()//ranaudamos dataTask que por default inicia en un estado suspendido
    }
    
    static func delete (uri: String, parameter: String) {
        let request = NSMutableURLRequest(url: NSURL (string: uri)! as URL) //Creamos objeto NSMutableURLRequest con la uri
        request.httpMethod = "POST" //Llamamos metodo httpMethod POST
        let postString = "parameter=\(parameter)" //Asignamos el parametro con el que se ejecutra el metodo POST
        request.httpBody = postString.data(using: String.Encoding.utf8) //Llamamos el metodo httpBody
        let task = URLSession.shared.dataTask(with: request as URLRequest) { //Creamos dataTask de la URLSession
            data, response, error in
            if error != nil {
                return
            }

        }
        task.resume() //ranaudamos dataTask que por default inicia en un estado suspendido
    }
    
    static func update (uri: String, parameter1: String, parameter2: String) {
        let request = NSMutableURLRequest(url: NSURL (string: uri)! as URL) //Creamos objeto NSMutableURLRequest con la uri
        request.httpMethod = "POST" //Llamamos metodo httpMethod POST
        let postString = "parameter1=\(parameter1)&parameter2=\(parameter2)" //Asignamos el parametro con el que se ejecutra el metodo POST
        request.httpBody = postString.data(using: String.Encoding.utf8) //Llamamos el metodo httpBody
        let task = URLSession.shared.dataTask(with: request as URLRequest) { //Creamos dataTask de la URLSession
            data, response, error in
            if error != nil {
//                print("error=\(String(describing: error))")
                return
            }
//
        }
        task.resume() //ranaudamos dataTask que por default inicia en un estado suspendido
    }
}

