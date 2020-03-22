//
//  Jugador.swift
//  TableViewController
//
//  Created by Alumno on 05/03/20.
//  Copyright © 2020 Alumno. All rights reserved.
//

import UIKit

class Jugador: NSObject {
    
    var nombre: String = ""
    var puntos: Int = 0
    var email: String = ""
    var imgFoto: UIImage!
    
    init(nombre : String, puntos : Int, email: String, imgFoto: UIImage){
        self.nombre = nombre
        self.puntos = puntos
        self.email = email
        self.imgFoto = imgFoto
    }
}
