//
//  Empleado.swift
//  MasDeTableViews
//
//  Created by user169165 on 4/16/20.
//  Copyright © 2020 user169165. All rights reserved.
//

import UIKit

class Empleado: NSObject {
    var nombre: String
    var sueldo: Float
    var foto: UIImage!
    var departamento: String
    
    init(nombre : String, sueldo : Float, foto: UIImage!, departamento: String) {
        self.nombre = nombre
        self.sueldo = sueldo
        self.foto = foto
        self.departamento = departamento
    }

}
