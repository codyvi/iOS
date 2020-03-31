//
//  ViewController.swift
//  Test
//
//  Created by user169165 on 3/24/20.
//  Copyright © 2020 user169165. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UIPickerViewDataSource,
UIPickerViewDelegate  {
    


    @IBOutlet weak var winview: UIView!
    @IBOutlet weak var picker: UIPickerView!
    
    var imageList: [UIImage] = [
            UIImage(named: "Apple")!,
            UIImage(named: "bar")!,
            UIImage(named: "cherry")!,
            UIImage(named: "crown")!,
            UIImage(named: "lemon")!,
            UIImage(named: "seven")!
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winview.isHidden = true;
        
    }
    
    @IBAction func play(_ sender: UIButton) {
        if(winview.isHidden) {
            for index in 0...2 {
                picker.selectRow(
                    Int.random(in: 0..<imageList.count),
                    inComponent: index,
                    animated: true
                )
            }
        }
        
        let firstComp: Int =
                picker.selectedRow(inComponent: 0);
        let secondComp: Int =
                picker.selectedRow(inComponent: 1);
        let thirdComp: Int =
                picker.selectedRow(inComponent: 2);
            
        if(
            firstComp == secondComp &&
            secondComp == thirdComp
            ){
                winview.isHidden = false;
               }

    }
    
    @IBAction func reset(_ sender: UIButton) {
        picker.reloadAllComponents()
        for index in 0...2 {
            picker.selectRow(
                0,
                inComponent: index,
                animated: true
            )
        }
        winview.isHidden = true;
    }
    
    
    func numberOfComponents(
        in pickerView: UIPickerView
    ) -> Int {
        return 3;
    }
    

    func pickerView(
        _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
    ) -> Int {
        return imageList.count
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        rowHeightForComponent component: Int
    ) -> CGFloat {
        return CGFloat(100)
    }
    
  
    func pickerView(
        _ pickerView: UIPickerView,
        viewForRow row: Int,
        forComponent component: Int,
        reusing view: UIView?
    ) -> UIView {
        
        let myImageView = UIImageView(
            frame: CGRect(x: 0, y: 0, width: 50, height: 50)
        )
        myImageView.image = imageList[row]
    
        return myImageView
    }


}
