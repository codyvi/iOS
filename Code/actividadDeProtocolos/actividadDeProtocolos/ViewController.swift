//
//  ViewController.swift
//  actividadDeProtocolos
//
//  Created by user169165 on 4/2/20.
//  Copyright © 2020 user169165. All rights reserved.
//

import UIKit

class ViewController: UIViewController, protocoloChangeColor{
    
    func changeColor(color: UIColor) {
        viewPrincipal.backgroundColor = color
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var viewPrincipal: UIView!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tableV = segue.destination as! TableViewController
        tableV.delegado = self
    }


}

