//
//  ViewController.swift
//  Tarea2Calendar
//
//  Created by Alumno on 25/02/20.
//  Copyright © 2020 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var lbMonth: UILabel!
    @IBOutlet weak var lbNDay: UILabel!
    @IBOutlet weak var lbDay: UILabel!
    
    var TodaysDate: Date = Date();
    var change: DateFormatter = DateFormatter();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dateToLb()
    }
    

    
    @IBAction func cambiarFecha(_ sender: UISwipeGestureRecognizer) {
        if(sender.direction == .left){
            TodaysDate = TodaysDate.addingTimeInterval(86400)
            dateToLb()
        }
        else if(sender.direction == .right){
            TodaysDate = TodaysDate.addingTimeInterval(-86400)
            dateToLb()
        }
    }
    
    

    
    func dateToLb (){
        change.dateFormat = "yyyy"
        lbYear.text = change.string(from: TodaysDate)
        change.dateFormat = "MMMM"
        lbMonth.text = change.string(from: TodaysDate)
        change.dateFormat = "dd"
        lbNDay.text = change.string(from : TodaysDate)
        change.dateFormat = "EEEE"
        lbDay.text = change.string(from: TodaysDate)
    }
    

}

