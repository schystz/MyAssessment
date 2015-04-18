//
//  SecondViewController.swift
//  MyAssessment
//
//  Created by schystz on 4/18/15.
//  Copyright (c) 2015 schystz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var buttonPressed: Int = 0
    @IBOutlet weak var label: UILabel!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = "button pressed is \(self.buttonPressed)"
        
        switch (self.buttonPressed) {
            case 1:
                self.view.backgroundColor = UIColor.blueColor()
            case 2:
                self.view.backgroundColor = UIColor.redColor()
            case 3:
                self.view.backgroundColor = UIColor.greenColor()
            default:
                break
        }
    }
    
    // MARK: - Actions
    
    @IBAction func didTapButton(sender: UIButton) {
        if let firstViewController = self.firstViewController() {
            firstViewController.buttonPressed = sender.tag
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK: - Private Methods
    
    func firstViewController() -> FirstViewController? {
        var firstViewController: FirstViewController?
        
        if let viewControllers = self.navigationController?.viewControllers {
            for controller in viewControllers {
                if (controller.isKindOfClass(FirstViewController)) {
                    firstViewController = controller as? FirstViewController
                    break
                }
            }
        }
        
        return firstViewController
    }

}
