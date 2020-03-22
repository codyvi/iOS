//
//  ViewControllerEsfera.swift
//  Tarea3
//
//  Created by Alumno on 28/02/20.
//  Copyright © 2020 Itesm. All rights reserved.
//

import UIKit

class ViewControllerEsfera: UIViewController {
    
    
    @IBOutlet weak var imgEsfera: UIImageView!
    @IBOutlet weak var lbRadio: UILabel!
    @IBOutlet weak var tfRadio: UITextField!
    
    var Resultado: Double = 0.0
    var RadioString: String!
    var Figura: UIImage!
    var Radio: Double = 0.0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaIni = segue.destination as! ViewController
        Radio = Double(tfRadio.text!)!
        Resultado = (4.0/3.0) * Double.pi * pow(Radio, 3.0)
        Figura = imgEsfera.image
        
        RadioString = "Radio: " + " \(Radio)"
        
        vistaIni.lbDatos.text = RadioString
        vistaIni.lbResultado.text = "\(Resultado)"
        vistaIni.imgFigura.image = Figura

    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if tfRadio.text! == ""  || Double(tfRadio.text!) == nil{
            let alerta = UIAlertController(title: "Error", message: "Campo vacio, o Invalido", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(alerta, animated: true, completion: nil)
            return false
        }
        else{
            return true
        }
    }
    
    
    @IBAction func quitaTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    

    

}
