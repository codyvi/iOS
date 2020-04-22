//
//  ViewController.swift
//  Mini Reto 2
//
//  Created by user169165 on 4/8/20.
//  Copyright © 2020 user169165. All rights reserved.
//

import UIKit

protocol administraCategorias {
    func agregaCategoria(categoria : Categoria) -> Void
    func modificaCategoria(newColor: UIColor, oldColor: UIColor) -> Void
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tfCategoryName: UITextField!
    
    var segueID:String = ""
    var colorsToUse = [UIColor]()
    var delegado : administraCategorias!
    var categoria: Categoria!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(categoria != nil){
            self.title = "Editar " + categoria.Titulo
            tfCategoryName.text = categoria.Titulo
            tfCategoryName.isEnabled = false;
        }
            
        else {
            self.title = "Nueva Categoria"
            tfCategoryName.isEnabled = true;
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorsToUse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCellColors", for: indexPath)

        cell.backgroundColor = colorsToUse[indexPath.row].withAlphaComponent(0.75)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tfCategoryName.text != "" {

            let uiColor = colorsToUse[indexPath.row]
                   
            if(tfCategoryName.isEnabled) {
                       let nuevaCategoria = Categoria(Titulo: tfCategoryName.text!, Color: uiColor)
                       delegado.agregaCategoria(categoria: nuevaCategoria)
                   }
            
            else {
                delegado.modificaCategoria(newColor: uiColor, oldColor: categoria.Color)
                       categoria.Color = uiColor
                   }
                   
                navigationController?.popToRootViewController(animated: true)
        
               }

    }

}

