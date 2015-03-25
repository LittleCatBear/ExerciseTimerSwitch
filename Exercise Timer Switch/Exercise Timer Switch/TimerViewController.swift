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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.timingLab.text = tempTimeLab
    }
}

