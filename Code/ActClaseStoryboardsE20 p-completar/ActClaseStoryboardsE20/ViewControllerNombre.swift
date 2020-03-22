//
//  ViewControllerNombre.swift
//  ActClaseStoryboardsE20
//
//  Created by Alumno on 27/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewControllerNombre: UIViewController {
    
    @IBOutlet weak var lbNombre: UITextField!
    var Nombre: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaIni = segue.destination as! ViewController
        vistaIni.Nombre = lbNombre.text!
    }
    

}
