//
//  ViewController.swift
//  TableViewController
//
//  Created by Alumno on 05/03/20.
//  Copyright © 2020 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var player: Jugador!
    var foto: UIImage!

    @IBOutlet weak var imgJugador: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbPuntos: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Jugador"
        // Do any additional setup after loading the view.
        imgJugador.image = player.imgFoto
        lbName.text = "Nombre: "  + player.nombre
        lbPuntos.text = "Puntos: " + "\(player.puntos)"
        lbEmail.text = "Email: " + player.email
    }


}

