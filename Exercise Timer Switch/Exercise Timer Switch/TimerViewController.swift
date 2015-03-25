//
//  TimerViewController.swift
//  Exercise Timer Switch
//
//  Created by Julie Huguet on 26/03/2015.
//  Copyright (c) 2015 Shokunin-Software. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class TimerViewController: UIViewController {
    
    
    @IBOutlet weak var exerciseLabel: UILabel!

    @IBOutlet weak var timingLab: UILabel!
    var tempTimeLab:NSString = " "
    var seconds:NSInteger = 0
    var sec : NSInteger = 0
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        while(true){
            if(self.sec == 0){
                self.getExercise()
                //self.lauchExercise()
            }
        }
    }
    
    func getExercise(){
        
    }
    
    func lauchExercise(ex:NSString){
        self.exerciseLabel.text = ex
        self.sec = self.seconds
        self.timingLab.text = "Time: \(seconds)"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
    }
    
    func subtractTime() {
        sec--
        timingLab.text = "Time: \(sec)"
        
        if(seconds == 0)  {
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.timingLab.text = tempTimeLab
        self.seconds = self.tempTimeLab.integerValue
    }
}

