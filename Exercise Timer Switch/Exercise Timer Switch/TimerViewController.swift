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
    @IBOutlet weak var repeatButton: UIButton!
    var seconds:NSInteger = 0
    var sec : NSInteger = 0
    var totalRounds:NSInteger = 0
    var tempRounds:NSInteger = 0
    var timer = NSTimer()
    var countdown = NSTimer()
    var cd:NSInteger = 5
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        repeatButton.enabled = false
        self.sec = self.seconds
        self.tempRounds = self.totalRounds
        countdown = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("countDownSub"), userInfo: nil, repeats: true)

       // self.lauchExercise(Float(sec))
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
        speech(self.exerciseLabel.text!)
        self.sec = self.seconds
        //self.tempRounds = totalRounds
        self.timingLab.text = "Time: \(sec)"
        self.roundLabel.text = "Round: \(tempRounds)"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
    }
    
    func speech(say:NSString){
        myUtterance = AVSpeechUtterance(string:say)
        myUtterance.rate = 0.1
        synth.speakUtterance(myUtterance)
    }
    
    func countDownSub(){
        
        if(cd == -1){
            countdown.invalidate()
            lauchExercise(Float(seconds))
        } else if(cd == 0){
            self.exerciseLabel.text = "Begin"
            speech(self.exerciseLabel.text!)
        } else{
            self.exerciseLabel.text = "\(cd)"
            speech(self.exerciseLabel.text!)
        }
        cd--
    }
    
    func subtractTime() {
        sec--
        tempRounds--
        timingLab.text = "Time: \(sec)"
        roundLabel.text = "Round: \(tempRounds)"
        if(tempRounds == 0){
            self.timingLab.text = "Time: 0"
            self.exerciseLabel.text = "Time completed"
            speech(self.exerciseLabel.text!)
            timer.invalidate()
            repeatButton.enabled = true
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
        countdown.invalidate()
        repeatButton.enabled = true
    }
    
    @IBAction func onClickRepeatButton(sender: UIButton) {
        repeatButton.enabled = false
        timer.invalidate()
        cd = 5
        tempRounds = totalRounds
        countdown = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("countDownSub"), userInfo: nil, repeats: true)

       // lauchExercise(Float(seconds))
        
    }
}

