//
//  Categoria.swift
//  Mini Reto 2
//
//  Created by user169165 on 4/8/20.
//  Copyright © 2020 user169165. All rights reserved.
//

import UIKit

class Categoria: NSObject {
    
    var Titulo: String = ""
    var Color: UIColor!
    
    init(Titulo: String, Color: UIColor) {
        self.Titulo = Titulo;
        self.Color = Color;
    }

}
