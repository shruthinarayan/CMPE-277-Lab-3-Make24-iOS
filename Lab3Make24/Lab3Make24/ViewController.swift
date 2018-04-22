//
//  ViewController.swift
//  Lab3Make24
//
//  Created by Shruthi Narayan on 4/20/18.
//  Copyright © 2018 Shruthi Narayan. All rights reserved.
//

import UIKit

//enum Operation:String {
//    case Add = "+"
//    case Subtract = "-"
//    case Multiply = "*"
//    case Divide = "/"
//    case Null = "Null"
//}

class ViewController: UIViewController {
    
    //UI connections
    @IBOutlet weak var clearButton: UIBarButtonItem!
    @IBOutlet weak var skipButton: UIBarButtonItem!
    
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
    
    var n1 = "0", n2 = "0", n3 = "0", n4 = "0"
    var str = ""
    var res = ""
    //var attemptCount = 0, successCount = 0, skipCount = 0
    //var currentOperation:Operation = .Null
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adding borders
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
        
        n1Button.setTitle(n1, for: .normal)
        n2Button.setTitle(n2, for: .normal)
        n3Button.setTitle(n3, for: .normal)
        n4Button.setTitle(n4, for: .normal)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Button Actions
    @IBAction func clearAction(_ sender: UIBarButtonItem) {
        str = ""
        stringLabel.text = str
        n1Button.isEnabled = true
        n2Button.isEnabled = true
        n3Button.isEnabled = true
        n4Button.isEnabled = true
    }
    @IBAction func skipAction(_ sender: UIBarButtonItem) {
        str = ""
        stringLabel.text = str
        
        //////////////change numbers///////////////////////////////////////
        
        n1Button.isEnabled = true
        n2Button.isEnabled = true
        n3Button.isEnabled = true
        n4Button.isEnabled = true
    }
    
    @IBAction func n1Action(_ sender: UIButton) {
        str += n1
        stringLabel.text = str
        n1Button.isEnabled = false
    }
    @IBAction func n2Action(_ sender: UIButton) {
        str += n2
        stringLabel.text = str
        n2Button.isEnabled = false
    }
   
    @IBAction func n3Action(_ sender: UIButton) {
        str += n3
        stringLabel.text = str
        n3Button.isEnabled = false
    }
    @IBAction func n4Action(_ sender: UIButton) {
        str += n4
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
        //////////////////delete one input//////////////////////
        stringLabel.text = str
    }
    @IBAction func doneAction(_ sender: UIButton) {
        /////////////////calculate//////////////////////////////
    }
    
}

