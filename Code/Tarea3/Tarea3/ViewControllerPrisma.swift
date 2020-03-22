//
//  ViewControllerPrisma.swift
//  Tarea3
//
//  Created by Alumno on 28/02/20.
//  Copyright © 2020 Itesm. All rights reserved.
//

import UIKit

class ViewControllerPrisma: UIViewController {
    
    @IBOutlet weak var imgPrisma: UIImageView!
    @IBOutlet weak var tfLargo: UITextField!
    @IBOutlet weak var tfAncho: UITextField!
    @IBOutlet weak var tfAltura: UITextField!
    
    var Resultado: Double = 0.0
    var ResultadoString: String!
    var Figura: UIImage!
    var Largo: Double = 0.0
    var Ancho: Double = 0.0
    var Altura: Double = 0.0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaIni = segue.destination as! ViewController
        Largo = Double(tfLargo.text!)!
        Ancho = Double(tfAncho.text!)!
        Altura = Double(tfAltura.text!)!
        
        Resultado = Largo * Ancho * Altura
        Figura = imgPrisma.image
        
        ResultadoString = "Largo: " + "\(Largo) \n"
        ResultadoString += "Ancho: " + "\(Ancho) \n"
        ResultadoString += "Altura: " + "\(Altura) \n"
        
        vistaIni.lbDatos.text = ResultadoString
        vistaIni.lbResultado.text = "\(Resultado)"
        vistaIni.imgFigura.image = Figura
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if tfLargo.text! == ""  || Double(tfLargo.text!) == nil || tfAncho.text! == ""  || Double(tfAncho.text!) == nil || tfAltura.text! == ""  || Double(tfAltura.text!) == nil {
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
