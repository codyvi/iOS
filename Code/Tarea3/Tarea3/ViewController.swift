//
//  ViewController.swift
//  Tarea3
//
//  Created by Alumno on 28/02/20.
//  Copyright © 2020 Itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgFigura: UIImageView!
    @IBOutlet weak var lbDatos: UILabel!
    @IBOutlet weak var lbResultado: UILabel!
    @IBOutlet weak var btnEsfera: UIButton!
    @IBOutlet weak var btnPrisma: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbDatos.text = ""
        lbResultado.text = ""
    }
    
    @IBAction func unwindEsfera(unwindSegue: UIStoryboardSegue){
        
    }
    
    @IBAction func unwindPrisma(unwindSegue: UIStoryboardSegue){
         
     }
    
    
    @IBAction func btnInicio(_ sender: UIButton) {
        imgFigura.image = nil
        lbDatos.text = ""
        lbResultado.text = ""
        
    }
    

}

