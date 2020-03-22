//
//  ViewController.swift
//  cargarDatosPlist
//
//  Created by Alumno on 12/03/20.
//  Copyright © 2020 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var lbTipo: UILabel!
    @IBOutlet weak var lbCapacidad: UILabel!
    @IBOutlet weak var lbPrecio: UILabel!
    @IBOutlet weak var imgFoto: UIImageView!
    
    
    var arrDicionarios: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        arrDicionarios = NSArray(contentsOfFile: path!)
    }
    
    //MARK: - Metodos de table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDicionarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda")!
        
        let dic = arrDicionarios[indexPath.row] as! NSDictionary
        
        celda.textLabel?.text = dic["tipo"] as? String
        
        return celda
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dic = arrDicionarios[indexPath.row] as! NSDictionary
        lbTipo.text = dic["tipo"] as? String
        lbCapacidad.text = dic["capacidad"] as? String
        
        let NSNum = dic["precio"] as! NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        
        lbPrecio.text = formatter.string(from: NSNum)
        
        let sUrl = dic["urlFoto"] as? String
        let url = URL(string: sUrl!)
        let imgData = NSData(contentsOf: url!)
        imgFoto.image = UIImage(data: imgData! as Data)
    }
    


}

