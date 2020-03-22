//
//  ViewController.swift
//  MiniReto1
//
//  Created by Alumno on 03/03/20.
//  Copyright © 2020 Itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Respuestas: UIView!
    @IBOutlet weak var color1Maquina: UIView!
    @IBOutlet weak var color2Maquina: UIView!
    @IBOutlet weak var color3Maquina: UIView!
    @IBOutlet weak var color4Maquina: UIView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var ayuda1: UIView!
    @IBOutlet weak var ayuda2: UIView!
    @IBOutlet weak var ayuda3: UIView!
    @IBOutlet weak var ayuda4: UIView!
    @IBOutlet weak var scCambiarGamemode: UISegmentedControl!
    
    
    let arrColores = [UIColor.blue, UIColor.brown, UIColor.cyan, UIColor.green, UIColor.red, UIColor.yellow]
    var intentos = 0
    var coloresBtn = [Int]()
    var coloresMaquina = [Int]()
    var arrAyudas = [UIColor.gray, UIColor.white, UIColor.red]
    var iguales = [0,0,0,0]
    var tmp = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coloresBtn.removeAll()
        btn1.backgroundColor = .blue
        coloresBtn.append(0)
        btn2.backgroundColor = .red
        coloresBtn.append(4)
        btn3.backgroundColor = .yellow
        coloresBtn.append(5)
        btn4.backgroundColor = .green
        coloresBtn.append(3)
        setColoresVista()
        ayuda1.backgroundColor = .gray
        ayuda2.backgroundColor = .gray
        ayuda3.backgroundColor = .gray
        ayuda4.backgroundColor = .gray
    }
    
    @IBAction func cambiarColor(_ sender: UIButton) {
        if coloresBtn[sender.tag] != 5 {
            coloresBtn[sender.tag] += 1;
          }
          else{
            coloresBtn[sender.tag] = 0;
          }
        
        sender.backgroundColor = arrColores[coloresBtn[sender.tag]]
    }
    
    func setColoresVista() -> Void {
        tmp = Int.random(in: 0 ... 5)
        let var1 = tmp
        tmp = Int.random(in: 0...5)
        while(var1 == tmp)
        {
          tmp = Int.random(in: 0...5)
        }
        let var2 = tmp
        tmp = Int.random(in: 0...5)
        while(var1 == tmp || var2 == tmp)
        {
          tmp = Int.random(in: 0...5)
        }
        let var3 = tmp
        tmp = Int.random(in: 0...5)
        while(var1 == tmp || var2 == tmp || var3 == tmp)
        {
          tmp = Int.random(in: 0...5)
        }
        let var4 = tmp;
        coloresMaquina.removeAll()
        color1Maquina.backgroundColor = arrColores[var1]
        color2Maquina.backgroundColor = arrColores[var2]
        color3Maquina.backgroundColor = arrColores[var3]
        color4Maquina.backgroundColor = arrColores[var4]
        coloresMaquina.append(var1)
        coloresMaquina.append(var2)
        coloresMaquina.append(var3)
        coloresMaquina.append(var4)
    }
    
    @IBAction func Control(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            Respuestas.isHidden = true
        case 1:
            Respuestas.isHidden = false
        default: print("Hola")
            
        }
    }
    
    @IBAction func iniciar(_ sender: UIButton) {
        coloresBtn.removeAll()
        intentos = 0
        setColoresVista()
        btn1.backgroundColor = .blue
        coloresBtn.append(0)
        btn2.backgroundColor = .red
        coloresBtn.append(4)
        btn3.backgroundColor = .yellow
        coloresBtn.append(5)
        btn4.backgroundColor = .green
        coloresBtn.append(3)
        ayuda1.backgroundColor = .gray
        ayuda2.backgroundColor = .gray
        ayuda3.backgroundColor = .gray
        ayuda4.backgroundColor = .gray
        scCambiarGamemode.selectedSegmentIndex = 0
        Respuestas.isHidden = true
    }

    func isDuplicate() -> Bool {
        if coloresBtn.count != Set(coloresBtn).count {
            let alert = UIAlertController(title: "Cuidado", message: "No puede haber dos o mas cuadros con el mismo color", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    func checkColor() -> Void {
        for i in 0...3{
            for j in 0...3{
                if i == j{
                    if(coloresMaquina[i] == coloresBtn[j]){
                        iguales[i] = 2
                    }
                }
                else{
                    if (coloresMaquina[i] == coloresBtn[j]){
                        iguales[i] = 1
                    }
                }
            }
        }
    }
    
    func ponerCuadrosAyuda() -> Void {
        iguales.sort()
        ayuda1.backgroundColor = arrAyudas[iguales[0]]
        ayuda2.backgroundColor = arrAyudas[iguales[1]]
        ayuda3.backgroundColor = arrAyudas[iguales[2]]
        ayuda4.backgroundColor = arrAyudas[iguales[3]]
    }
    
    func checkWin() -> Bool {
        for i in 0...3{
            if iguales[i] != 2 {
                return false
            }
        }
        return true
    }
    
    
    @IBAction func probar(_ sender: UIButton) {
        if isDuplicate(){
            for i in 0...3{
                iguales[i] = 0
            }
            checkColor()
            ponerCuadrosAyuda()
            intentos += 1
            if checkWin() {
                let alert = UIAlertController(title: "Felicidades", message: "Ganaste el juego en " + String(intentos) + " intentos", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    

}

