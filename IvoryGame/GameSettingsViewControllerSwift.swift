//
//  GameSettingsViewControllerSwift.swift
//  IvoryGame
//
//  Created by Miroslav Ivanov on 2/5/16.
//  Copyright © 2016 Miroslav Ivanov. All rights reserved.
//

import UIKit

class GameSettingsViewControllerSwift: UIViewController {
    
    //TODO: save options in core data
    

    @IBOutlet weak var soundSwitch: UISwitch!
    
    
    @IBOutlet weak var vibrationSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.soundSwitch.on = (appDelegate?.isSoundOn)!;
        self.vibrationSwitch.on = (appDelegate?.isVibrationOn)!;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func soundSwitchValueChanged(sender: UISwitch) {
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        appDelegate?.isSoundOn = sender.on;
        NSLog("%@", (appDelegate?.isSoundOn)!);
    }
    
    @IBAction func vibrationSwitchValueChanged(sender: UISwitch) {
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        appDelegate?.isVibrationOn = sender.on;
        NSLog("%@", (appDelegate?.isVibrationOn)!);
    }
}
