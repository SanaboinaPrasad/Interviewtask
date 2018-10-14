//
//  PickerVC.swift
//  Taskmaps
//
//  Created by Sriram Prasad on 12/10/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit

class PickerVC: UIViewController {
    
    @IBOutlet weak var doneButton: UIButton!
    let montharry = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    
    var yearData = [String]()
    var monthsInPickerView = [String]()
    var years = [String]()
    @IBOutlet weak var pickerVC: UIPickerView!
    @IBOutlet weak var monthTextFld: UITextField!
    @IBOutlet weak var yearTextFld: UITextField!
    
    var secondColumnData = [[String]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Picker VC"
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let calendar1 = Calendar.current
        let month1 = calendar1.dateComponents([.month], from: Date()).month!
        monthsInPickerView = Array(montharry.dropFirst(month1 - 1))
        let years = calendar1.dateComponents([.year], from: Date()).year!
        print(years)
        for i in(stride(from: years, to: 2999, by: 1)){
            yearData.append(String(i))
            secondColumnData = [monthsInPickerView,montharry]
            pickerVC.reloadAllComponents()
            pickerVC.selectRow(0, inComponent: 1, animated: false)
        }
        
    }
    
    @IBAction func doneBtn(_ sender: UIButton)
    {
        pickerVC.isHidden = true
    }
    
}




extension PickerVC :UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 2
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return yearData.count
        } else {
            let selected = pickerVC.selectedRow(inComponent: 0)
            if selected == 0 {
                return secondColumnData[selected].count
            }
            else{
                return montharry.count
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return yearData[row]
        } else {
            let selected = pickerVC.selectedRow(inComponent: 0)
            if selected == 0 {
                return secondColumnData[selected][row]
            }
            else{
                return montharry[row]
                
            }
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        doneButton.isHidden = false
        if component == 0 {
            pickerView.reloadComponent(1)
            let yearSelected = pickerVC.selectedRow(inComponent: 0)
            yearTextFld.text = yearData[yearSelected]
            pickerView.reloadComponent(0)
            
        }
        else{
            
            let selected = pickerVC.selectedRow(inComponent: 0)
            if selected == 0 {
                monthTextFld.text = monthsInPickerView[row]
                
            }
            else {
                monthTextFld.text = montharry[row]
                
            }
        }
    }
}
