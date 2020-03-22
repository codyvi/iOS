//
//  TableViewController.swift
//  TableViewController
//
//  Created by Alumno on 05/03/20.
//  Copyright © 2020 Alumno. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    //Crea un arreglo de objetos vacios
    var listaJugadores = [Jugador]()
    var imagen = UIImage(named: "mickey")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Jugadores"
        
        let jug1 = Jugador(nombre: "David", puntos: 1800, email: "david@gmail.com", imgFoto: UIImage(named: "mickey")!)
        let jug2 = Jugador(nombre: "Rosy", puntos: 2500, email: "Rosy@tec.mx", imgFoto: UIImage(named: "Donald_Duck")!)
        let jug3 = Jugador(nombre: "Benja", puntos: 100, email: "benja@hotmail.com", imgFoto: UIImage(named: "Usuario")!)
        listaJugadores += [jug1, jug2, jug3]
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaJugadores.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell")!
        cell.textLabel?.text = listaJugadores[indexPath.row].nombre
        cell.imageView?.image = listaJugadores[indexPath.row].imgFoto


        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vistaInfo = segue.destination as! ViewController
        
        let i = tableView.indexPathForSelectedRow!
        vistaInfo.player = listaJugadores[i.row]
        
        
    }
    

}
