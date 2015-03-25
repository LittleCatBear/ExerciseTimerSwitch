//
//  SecondViewController.swift
//  Exercise Timer Switch
//
//  Created by Julie Huguet on 26/03/2015.
//  Copyright (c) 2015 Shokunin-Software. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var ExerciseTableView: UITableView!
    @IBOutlet weak var timingTextField: UITextField!
    @IBOutlet weak var timingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClickNewTiming(sender: UIButton) {
        self.timingLabel.text = self.timingTextField.text
    }

    @IBAction func goToInit(segue:UIStoryboardSegue){
        NSLog("Called goToInit: unwind action")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showTimer"){
            var temp = self.timingLabel.text!
            println(temp)
            var controller:TimerViewController = segue.destinationViewController as TimerViewController
            controller.tempTimeLab = "Timing:\(temp)"
        }
        
    }
    
    @IBAction func onClickStartButton(sender: UIButton) {
        self.performSegueWithIdentifier("showTimer", sender: sender)
    }
}

