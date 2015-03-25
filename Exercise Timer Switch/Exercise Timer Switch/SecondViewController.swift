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
        self.ExerciseTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

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
            var temp = 10
            if(self.timingLabel.text != nil){
                 temp = self.timingLabel.text!.toInt()!
            }
            else if (self.timingTextField.text != nil){
                temp = self.timingTextField.text.toInt()!
            }
            
            var controller:TimerViewController = segue.destinationViewController as TimerViewController
            controller.tempTimeLab = temp
        }
        
    }
    
    @IBAction func onClickStartButton(sender: UIButton) {
        self.performSegueWithIdentifier("showTimer", sender: sender)
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

}

