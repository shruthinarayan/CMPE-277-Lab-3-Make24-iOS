//
//  SecondViewController.swift
//  Lab3Make24
//
//  Created by Shruthi Narayan on 4/26/18.
//  Copyright © 2018 Shruthi Narayan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var n1Picker: UIPickerView!
    
    let n1pickerData = [[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9]]
    var n1Assign = 1, n2Assign=1, n3Assign=1, n4Assign=1
    
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButton.layer.borderWidth = 1.0
        returnButton.layer.borderWidth = 1.0
        //n1Picker.layer.borderWidth = 1.0
        
        self.n1Picker.dataSource = self
        self.n1Picker.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return n1pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return n1pickerData[component].count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(n1pickerData[component] [row])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if (component == 0)
        {
            n1Assign=n1pickerData[0][row]
            //print("n1: \(n1Assign)")
            //self.view.backgroundColor = UIColor.black
        }
        else if (component == 1)
        {
            n2Assign=n1pickerData[1][row]
            //self.view.backgroundColor = UIColor.blue
            //print("n2: \(n2Assign)")
        }
        else if (component == 2)
        {
            n3Assign=n1pickerData[2][row]
            //self.view.backgroundColor = UIColor.brown
            //print("n3: \(n3Assign)")
        }
        else
        {
            n4Assign=n1pickerData[3][row]
            //self.view.backgroundColor = UIColor.cyan
            //print("n4: \(n4Assign)")
        }
    }
    
    @IBAction func setAction(_ sender: UIButton) {
        //        n1=n1Assign
        //        n2=n2Assign
        //        n3=n3Assign
        //        n4=n4Assign
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
