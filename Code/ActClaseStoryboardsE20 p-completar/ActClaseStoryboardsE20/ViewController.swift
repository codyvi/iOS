//
//  ViewController.swift
//  ActClaseStoryboardsE20
//
//  Created by Yolanda Martinez on 25/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var tfNum: UITextField!
    @IBOutlet weak var imUser: UIImageView!
    
    var Nombre: String!
    var NumCel: String!
    var User: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindNombre(unwindSegue: UIStoryboardSegue) {
        lbNombre.text = Nombre
    }
    
    @IBAction func unwindFoto(unwindSegue: UIStoryboardSegue){
        tfNum.text = NumCel
        imUser.image = User
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "fotoyNum") {
        let vistaNum = segue.destination as! ViewControllerFotoyCel
        vistaNum.NumCel = tfNum.text
        }
            
    }
    

}

