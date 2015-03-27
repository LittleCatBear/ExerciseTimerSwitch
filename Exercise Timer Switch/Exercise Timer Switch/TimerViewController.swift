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
    var seconds:NSInteger = 0
    var sec : NSInteger = 0
    var timer = NSTimer()
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sec = self.seconds
                self.getExercise()
                self.lauchExercise()
    }
    
    func getExercise() -> NSString{
        var total:UInt32 = UInt32(globalExerciceTable.count)
        var num = Int(arc4random_uniform(total))
        if globalExerciceTable.isEmpty {
            return "no data"
        }
        return globalExerciceTable[num]
    }
    
    func lauchExercise(){
        self.exerciseLabel.text = getExercise()
       // self.exerciseLabel.sizeToFit()
        self.exerciseLabel.fadeOut(duration: 2, delay: 0.0, completion: {
            (finished:Bool) -> Void in
            self.exerciseLabel.fadeIn(duration: 2, delay: 0.0)
        })
        
        myUtterance = AVSpeechUtterance(string: self.exerciseLabel.text)
        myUtterance.rate = 0.1
        synth.speakUtterance(myUtterance)
        self.sec = self.seconds
        self.timingLab.text = "Time: \(sec)"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
    }
    
    func subtractTime() {
        sec--
        timingLab.text = "Time: \(sec)"
        
        if(sec == -1)  {
            timer.invalidate()
            lauchExercise()
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    @IBAction func onClickStopButton(sender: UIButton) {
        timer.invalidate()
    }
}

