//
//  TableTableViewController.swift
//  MasDeTableViews
//
//  Created by user169165 on 4/16/20.
//  Copyright © 2020 user169165. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell{
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbSueldo: UILabel!
    @IBOutlet weak var lbDepartamento: UILabel!
    
}

class TableTableViewController: UITableViewController {
    
    var listaDatos = [Empleado]()
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaDatos.append(Empleado(nombre: "Jorge", sueldo: 100.0, foto: UIImage(named: "beto"), departamento: "Ventas"))
        
        listaDatos.append(Empleado(nombre: "Silva", sueldo: 100.0, foto: UIImage(named: "elmo"), departamento: "Compras"))
        
        listaDatos.append(Empleado(nombre: "Ricardo", sueldo: 150.0, foto: UIImage(named: "lucas"), departamento: "Tecnologia"))
        
        listaDatos.append(Empleado(nombre: "Enrique", sueldo: 200.25, foto: UIImage(named: "enrique"), departamento: "RH"))
        
      
 


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.title = "Empleados"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaDatos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath) as! CustomTableViewCell

        cell.imageView?.image = listaDatos[indexPath.row].foto
        cell.lbNombre.text = listaDatos[indexPath.row].nombre
        cell.lbSueldo.text = "\(listaDatos[indexPath.row].sueldo)"
        cell.lbDepartamento.text = listaDatos[indexPath.row].departamento
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .cyan
        }

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            listaDatos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let temp = listaDatos[fromIndexPath.row]
        listaDatos[fromIndexPath.row] = listaDatos[to.row]
        listaDatos[to.row] = temp

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
