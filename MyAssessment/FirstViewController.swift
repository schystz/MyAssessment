//
//  FirstViewController.swift
//  MyAssessment
//
//  Created by schystz on 4/18/15.
//  Copyright (c) 2015 schystz. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var buttonPressed: Int = 0 {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var label: UILabel!
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let button = sender as? UIButton {
            let destinationController: AnyObject = segue.destinationViewController
            if (destinationController.isKindOfClass(SecondViewController)) {
                let secondViewController = destinationController as! SecondViewController
                secondViewController.buttonPressed = button.tag
            }
        }
    }

    // MARK: - Actions
    
    @IBAction func didTapButton(sender: UIButton) {
        self.performSegueWithIdentifier("ShowSecondViewController", sender: sender)
        self.buttonPressed = 0
    }
    
    // MARK: - Private Methods
    
    func updateUI() {
        switch (self.buttonPressed) {
            case 1:
                self.label.text = "button pressed is ONE"
            case 2:
                self.label.text = "button pressed is TWO"
            case 3:
                self.label.text = "button pressed is THREE"
            default:
                self.label.text = "None"
        }
    }

}

