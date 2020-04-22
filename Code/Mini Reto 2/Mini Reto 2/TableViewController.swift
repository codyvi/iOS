//
//  TableViewController.swift
//  Mini Reto 2
//
//  Created by user169165 on 4/8/20.
//  Copyright © 2020 user169165. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, administraCategorias {

    
    var categoryList = [Categoria]()
    var colorsToUse = [UIColor.blue, UIColor.green, UIColor.purple, UIColor.red, UIColor.yellow, UIColor.orange, UIColor.cyan]
    var UsedColors = [UIColor]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lista de pendientes"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoryList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
        
        cell.textLabel?.text = categoryList[indexPath.row].Titulo
        
        cell.backgroundColor = categoryList[indexPath.row].Color.withAlphaComponent(0.75)
        
        return cell
    }
    


    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destino = segue.destination as! ViewController
        destino.colorsToUse = colorsToUse
        
      
         if segue.identifier == "Edit" {
             let indexPath = tableView.indexPathForSelectedRow!
             destino.categoria = categoryList[indexPath.row]
             
         }
        
        destino.delegado = self
        
    }
    
    func agregaCategoria(categoria: Categoria) {
        categoryList.append(categoria)
        if let position = colorsToUse.firstIndex(of: categoria.Color) {
            colorsToUse.remove(at: position)
            tableView.reloadData()
        }
    }
    
    func modificaCategoria(newColor: UIColor, oldColor: UIColor) {
        if let position = colorsToUse.firstIndex(of:  newColor) {
                   colorsToUse.remove(at: position)
                   colorsToUse.append(oldColor)
               }
               
        tableView.reloadData()
    }
    

}
