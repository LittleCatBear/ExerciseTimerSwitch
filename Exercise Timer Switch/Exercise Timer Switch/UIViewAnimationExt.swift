//
//  UIViewAnimationExt.swift
//  Exercise Timer Switch
//
//  Created by Julie Huguet on 27/03/2015.
//  Copyright (c) 2015 Shokunin-Software. All rights reserved.
//


import Foundation
import UIKit

extension UIView {
    func fadeIn(duration: NSTimeInterval = 1.0, delay: NSTimeInterval = 0.0, completion: ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 1.0
            self.backgroundColor = UIColor.blueColor()
            self.sizeToFit()
            }, completion: completion)  }
    
    func fadeOut(duration: NSTimeInterval = 1.0, delay: NSTimeInterval = 0.0, completion: (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 0.5
            self.backgroundColor = UIColor.greenColor()
            }, completion: completion)
    }
}