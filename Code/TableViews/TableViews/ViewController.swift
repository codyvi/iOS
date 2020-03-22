//
//  ViewController.swift
//  TableViews
//
//  Created by Alumno on 02/03/20.
//  Copyright © 2020 Itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var lista = ["a", "b", "c", "d", "e", "f"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Lista de Datos"
    }
    
    //MARK: - Métodos de Table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "idCell")!
        celda.textLabel?.text = lista[indexPath.row]
        celda.detailTextLabel?.text = String(indexPath.row)
        celda.imageView?.image = UIImage(named: "Donald_Duck")
        
        return celda
        
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaDetalle = segue.destination as! ViewControllerDetalle
        let indice = tableView.indexPathForSelectedRow!
        vistaDetalle.datoMostrar = lista[indice.row]
    }
}

