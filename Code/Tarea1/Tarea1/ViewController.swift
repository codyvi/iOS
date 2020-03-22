//
//  ViewController.swift
//  Tarea1
//
//  Created by Alumno on 18/02/20.
//  Copyright © 2020 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfCalifParcial: UITextField!
    @IBOutlet weak var tfCalifEFinal: UITextField!
    @IBOutlet weak var tfNotaFinal: UITextField!
    @IBOutlet weak var labelABorrar: UILabel!
    @IBOutlet weak var labelACambiar: UILabel!
    var SwitchPrendido: Bool = true
    @IBOutlet weak var txtButton: UIButton!
    @IBOutlet weak var tfCalifActividades: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculaCalif(_ sender: UIButton) {
        
        if(SwitchPrendido == true)
        {
            if let parciales = Double(tfCalifParcial.text!),
                let actividades = Double(tfCalifActividades.text!),
                let examenFinal = Double(tfCalifEFinal.text!)
            {
                let newParciales = parciales * 0.5
                let newActividades = actividades * 0.2
                let newEFinal = examenFinal * 0.3
                
                let NotaFinal = newParciales + newActividades + newEFinal
                
                tfNotaFinal.text = "\(NotaFinal)"
            }
            
            else{
                let alerta = UIAlertController(title: "Error", message: "Los campos deben tener datos", preferredStyle: .alert)
                
                let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alerta.addAction(accion)
                
                present(alerta, animated: true, completion: nil)
            }
        }
            
        else{

            if let parciales = Double(tfCalifParcial.text!),
                let actividades = Double(tfCalifActividades.text!)
            {
                let newParciales = parciales * 0.5
                let newActividades = actividades * 0.2
                
                let CalifSinFinal = newParciales + newActividades
                let CSFMensoSetenta = 70 - CalifSinFinal
                
                let CalifParaPasar = (CSFMensoSetenta * 100)/30
                tfNotaFinal.text = "\(CalifParaPasar)"
            }
            
            else{
                let alerta = UIAlertController(title: "Error", message: "Los campos deben tener datos", preferredStyle: .alert)
                
                let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alerta.addAction(accion)
                
                present(alerta, animated: true, completion: nil)
            }
            
        }
    }
    
    
    @IBAction func cambiarTexto(_ sender: UISwitch) {
        if(sender.isOn == true)
        {
        txtButton.setTitle("Calcula Nota Final", for: .normal)
            labelABorrar.isHidden = false;
            labelACambiar.text = "Nota Final"
            tfCalifEFinal.isHidden = false;
            SwitchPrendido = true
            tfCalifParcial.text = ""
            tfCalifActividades.text = ""
            tfCalifEFinal.text = ""
            tfNotaFinal.text = ""
        }
            
        else {
        txtButton.setTitle("Calcula Nota Pasar", for: .normal)
            labelABorrar.isHidden = true;
            labelACambiar.text = "Nota para pasar"
            tfCalifEFinal.isHidden = true;
            SwitchPrendido = false
            tfCalifParcial.text = ""
            tfCalifActividades.text = ""
            tfCalifEFinal.text = ""
            tfNotaFinal.text = ""
        }
    }
    
    @IBAction func quitarTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

