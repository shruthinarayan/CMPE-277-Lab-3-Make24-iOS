//
//  ViewController.swift
//  Lab3Make24
//
//  Created by Shruthi Narayan on 4/20/18.
//  Copyright © 2018 Shruthi Narayan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //////////UI connections//////////
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var successLabel: UILabel!
    @IBOutlet weak var attemptLabel: UILabel!
    @IBOutlet weak var skippedLabel: UILabel!
    
    @IBOutlet weak var stringLabel: UILabel!
    
    @IBOutlet weak var n1Button: UIButton!
    @IBOutlet weak var n2Button: UIButton!
    @IBOutlet weak var n3Button: UIButton!
    @IBOutlet weak var n4Button: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var mulButton: UIButton!
    @IBOutlet weak var divButton: UIButton!
    
    @IBOutlet weak var lbracButton: UIButton!
    @IBOutlet weak var rbracButton: UIButton!
    @IBOutlet weak var delButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    //////////Declare variables //////////
    var n1 = 0, n2 = 0, n3 = 0, n4 = 0
    var timer = Timer()
    var time = 0
    var str = ""
    var sol = ""
    var attemptCount = 1, successCount = 0, skipCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //////////Add Borders//////////
        timeLabel.layer.borderWidth = 1.0
        successLabel.layer.borderWidth = 1.0
        attemptLabel.layer.borderWidth = 1.0
        skippedLabel.layer.borderWidth = 1.0
        
        stringLabel.layer.borderWidth = 1.0
        
        n1Button.layer.borderWidth = 1.0
        n2Button.layer.borderWidth = 1.0
        n3Button.layer.borderWidth = 1.0
        n4Button.layer.borderWidth = 1.0
        
        addButton.layer.borderWidth = 1.0
        subButton.layer.borderWidth = 1.0
        mulButton.layer.borderWidth = 1.0
        divButton.layer.borderWidth = 1.0
        
        lbracButton.layer.borderWidth = 1.0
        rbracButton.layer.borderWidth = 1.0
        delButton.layer.borderWidth = 1.0
        doneButton.layer.borderWidth = 1.0
        
        //////////First Game on App Load//////////
        randomNumberGenerator()
        setTitleEnableButtonsInit()
        runTimer()
        
        skippedLabel.text="\(skipCount)"
        successLabel.text="\(successCount)"
    }
    
    //////////Button Actions//////////
    @IBAction func clearAction(_ sender: UIBarButtonItem) {
        str = ""
        stringLabel.text = str
        n1Button.isEnabled = true
        n2Button.isEnabled = true
        n3Button.isEnabled = true
        n4Button.isEnabled = true
    }
    
    
    @IBAction func skipAction(_ sender: UIBarButtonItem) {
        skipCount+=1
        //print("\(skipCount)")
        skippedLabel.text="\(skipCount)"
        
        randomNumberGenerator()
        setTitleEnableButtonsInit()
    }
    
    
    @IBAction func showMeAction(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Solution", message: "\(sol)=24", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "New Puzzle", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
            self.randomNumberGenerator()
            self.setTitleEnableButtonsInit()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func assignNumbersAction(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Assign Numbers", message: "\n\n\n\n\n\n\n\n\n\n", preferredStyle: .alert)
        alert.isModalInPopover = true
        let pickerFrame = UIPickerView(frame: CGRect(x: 20, y: 20, width: 250, height: 140))
        alert.view.addSubview(pickerFrame)
        pickerFrame.dataSource = self
        pickerFrame.delegate = self
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Set", style: .default, handler: { (UIAlertAction) in
            
            //print("You selected: \(self.n1Assign) \(self.n2Assign) \(self.n3Assign) \(self.n4Assign)")
            self.n1=self.n1Assign
            self.n2=self.n2Assign
            self.n3=self.n3Assign
            self.n4=self.n4Assign
            
            self.setTitleEnableButtonsInit()
        }))
        self.present(alert,animated: true, completion: nil )
    }
    
    
    @IBAction func n1Action(_ sender: UIButton) {
        str += "\(n1)"
        stringLabel.text = str
        n1Button.isEnabled = false
    }
    @IBAction func n2Action(_ sender: UIButton) {
        str += "\(n2)"
        stringLabel.text = str
        n2Button.isEnabled = false
    }
    @IBAction func n3Action(_ sender: UIButton) {
        str += "\(n3)"
        stringLabel.text = str
        n3Button.isEnabled = false
    }
    @IBAction func n4Action(_ sender: UIButton) {
        str += "\(n4)"
        stringLabel.text = str
        n4Button.isEnabled = false
    }
    
    
    @IBAction func addAction(_ sender: UIButton) {
        str += "+"
        stringLabel.text = str
    }
    @IBAction func subAction(_ sender: UIButton) {
        str += "-"
        stringLabel.text = str
    }
    @IBAction func mulAction(_ sender: UIButton) {
        str += "*"
        stringLabel.text = str
    }
    @IBAction func divAction(_ sender: UIButton) {
        str += "/"
        stringLabel.text = str
    }
    @IBAction func lbracAction(_ sender: UIButton) {
        str += "("
        stringLabel.text = str
    }
    @IBAction func rbracAction(_ sender: UIButton) {
        str += ")"
        stringLabel.text = str
    }
    
    
    @IBAction func delAction(_ sender: UIButton) {
        if !(str.isEmpty) {
            
            let last = str.last!
            
            if ((last >= "1") && (last <= "9")) {
                
                let delNumber = Int(String(last))
                
                if ((delNumber == n1) && (n1Button.isEnabled == false))   {
                    n1Button.isEnabled = true
                }
                else if ((delNumber == n2) && (n2Button.isEnabled == false)) {
                    n2Button.isEnabled = true
                }
                else if ((delNumber == n3) && (n3Button.isEnabled == false)) {
                    n3Button.isEnabled = true
                }
                else if ((delNumber == n4) && (n4Button.isEnabled == false)) {
                    n4Button.isEnabled = true
                }
            }
            str.remove(at: str.index(before: str.endIndex))
            stringLabel.text = str
        }
    }
    
    
    @IBAction func doneAction(_ sender: UIButton) {
        attemptCount+=1
        //print("\(attemptCount)")
        attemptLabel.text="\(attemptCount)"
        
    }
    
    //////////Generate Random Numbers//////////
    func randomNumberGenerator() {
        //generate numbers 1-9
        n1 = Int(arc4random_uniform(9) + 1)
        n2 = Int(arc4random_uniform(9) + 1)
        n3 = Int(arc4random_uniform(9) + 1)
        n4 = Int(arc4random_uniform(9) + 1)
    }
    func setTitleEnableButtonsInit(){
        //set value on buttons
        n1Button.setTitle("\(n1)", for: .normal)
        n2Button.setTitle("\(n2)", for: .normal)
        n3Button.setTitle("\(n3)", for: .normal)
        n4Button.setTitle("\(n4)", for: .normal)
        
        //enable buttons
        n1Button.isEnabled = true
        n2Button.isEnabled = true
        n3Button.isEnabled = true
        n4Button.isEnabled = true
        
        time = 0
        str = ""
        stringLabel.text = str
        
        attemptCount=1
        //print("\(attemptCount)")
        attemptLabel.text="\(attemptCount)"
    }
    
    //////////Build a Timer//////////
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(incrementTime), userInfo: nil, repeats: true)
    }
    @objc func incrementTime() {
        time += 1     //increment the seconds
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        if seconds < 10 {
            timeLabel.text = "\(minutes):0\(seconds)"
        }
        else{
            timeLabel.text = "\(minutes):\(seconds)"
        }
    }
    
    
    //////////Assign Numbers Alert-Picker//////////
    var n1pickerData = [[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9],[1,2,3,4,5,6,7,8,9]]
    var pickerView = UIPickerView()
    var n1Assign = 1, n2Assign=1, n3Assign=1, n4Assign=1
    
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

