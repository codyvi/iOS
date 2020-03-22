//
//  ViewController.swift
//  Actividad1
//
//  Created by Alumno on 17/02/20.
//  Copyright © 2020 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var vista1: UIView!
    

    @IBOutlet weak var pelota1: UIImageView!
    
    @IBAction func Slider(_ sender: UISlider) {
        let vieWidth = vista1.bounds.width
        let slidervalue = CGFloat(sender.value)
        let Value = (slidervalue * vieWidth)
        pelota1.frame.origin.x = Value
        print(Value)
    }
    
    @IBOutlet weak var vista2: UIView!
    
    @IBOutlet weak var MensajeAMover: UILabel!
    
    @IBAction func Control(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        
        case 0:
        UIView.animate(withDuration:1)
        {
            self.MensajeAMover.frame.origin.x = 15
        }
        
        case 1:
        UIView.animate(withDuration:1)
        {
            self.MensajeAMover.frame.origin.x = 275
            }
        
        default: print("Hola")
            
        }
        
        
        
        
    }
    
}

