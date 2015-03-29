//
//  SecondViewController.swift
//  Exercise Timer Switch
//
//  Created by Julie Huguet on 26/03/2015.
//  Copyright (c) 2015 Shokunin-Software. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var ExerciseTableView: UITableView!
    @IBOutlet weak var timingTextField: UITextField!
    @IBOutlet weak var timingLabel: UILabel!
    @IBOutlet weak var roundTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timingTextField.delegate = self
        self.timingLabel.text = ""
        self.ExerciseTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.ExerciseTableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   // @IBAction func onClickNewTiming(sender: UIButton) {
      //  self.timingLabel.text = self.timingTextField.text
     // self.timingLabel.textColor = UIColor.blackColor()
   // }

    @IBAction func goToInit(segue:UIStoryboardSegue){
        self.timingLabel.text = ""
        self.timingLabel.textColor = UIColor.blackColor()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        if (segue.identifier == "showTimer"){
            var temp = 0
            var tempRound = 1
            if (self.timingTextField.text != ""){
                temp = self.timingTextField.text.toInt()!
            }
            if (self.roundTextField.text != ""){
                if(self.roundTextField.text!.toInt() != nil && self.roundTextField.text.toInt() > 1){
                    tempRound = self.roundTextField.text!.toInt()!
                }
            }
            
            var controller:TimerViewController = segue.destinationViewController as TimerViewController
            controller.seconds = temp
            controller.totalRounds = tempRound
        }
    }
    
    @IBAction func onClickStartButton(sender: UIButton) {
        
        if shouldPerformSegueWithIdentifier("showTimer", sender: sender){
            self.performSegueWithIdentifier("showTimer", sender: sender)
        }
        else{
            self.timingLabel.text = "Wrong data !"
            self.timingLabel.textColor = UIColor(red: 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        var flag:Bool = false
        if (self.timingTextField.text != ""){
            if(self.timingTextField.text!.toInt() != nil && self.timingTextField.text.toInt() > 1){
                flag = true
            }
        }
        return flag
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalExerciceTable.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.ExerciseTableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel?.text = globalExerciceTable[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        textField.resignFirstResponder()
        return true;
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.timingLabel.text = ""
        self.timingLabel.textColor = UIColor.blackColor()
    }

}

