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
    
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var timingLab: UILabel!
    var seconds:NSInteger = 0
    var sec : NSInteger = 0
    var totalRounds:NSInteger = 0
    var tempRounds:NSInteger = 0
    var timer = NSTimer()
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sec = self.seconds
        self.tempRounds = self.totalRounds
        self.lauchExercise(Float(sec))
    }
    
    func getExercise() -> NSString{
        var total:UInt32 = UInt32(globalExerciceTable.count)
        var num = Int(arc4random_uniform(total))
        if globalExerciceTable.isEmpty {
            return "no data"
        }
        return globalExerciceTable[num]
    }
    
    func lauchExercise(timing:Float){
        var t = NSTimeInterval(timing-0.2)
        
        self.exerciseLabel.text = getExercise()
        self.exerciseLabel.sizeToFit()
        
        self.exerciseLabel.numberOfLines = 0
    
        self.exerciseLabel.fadeIn(completion: {
            (finished:Bool) -> Void in
            self.exerciseLabel.fadeOut()
        })
       // self.exerciseLabel.fadeIn(duration: 1.0, delay: 0.0)
        myUtterance = AVSpeechUtterance(string: self.exerciseLabel.text)
        myUtterance.rate = 0.1
        synth.speakUtterance(myUtterance)
        self.sec = self.seconds
        //self.tempRounds = totalRounds
        self.timingLab.text = "Time: \(sec)"
        self.roundLabel.text = "Round: \(tempRounds)"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
    }
    
    func subtractTime() {
        sec--
        tempRounds--
        timingLab.text = "Time: \(sec)"
        roundLabel.text = "Round: \(tempRounds)"
        if(tempRounds == 0){
            self.timingLab.text = "Time: 0"
            self.exerciseLabel.text = "Time completed"
            myUtterance = AVSpeechUtterance(string: self.exerciseLabel.text)
            myUtterance.rate = 0.1
            synth.speakUtterance(myUtterance)
            //roundLabel.text = "Round: 0"
            timer.invalidate()
        }else if(sec == 0)  {
                timer.invalidate()
                lauchExercise(Float(seconds))
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
    
    @IBAction func onClickRepeatButton(sender: UIButton) {
        timer.invalidate()
        tempRounds = totalRounds
        lauchExercise(Float(seconds))
        
    }
}

