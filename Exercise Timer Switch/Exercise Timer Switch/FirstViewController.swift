//
//  FirstViewController.swift
//  Exercise Timer Switch
//
//  Created by Julie Huguet on 26/03/2015.
//  Copyright (c) 2015 Shokunin-Software. All rights reserved.
//

import UIKit
import AVFoundation

var globalExerciceTable:[String] = [String]()

class FirstViewController: UIViewController {

    @IBOutlet weak var exerciseTableView: UITableView!
    @IBOutlet weak var ExerciseTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClickAddExercise(sender: UIButton) {
    }

}

