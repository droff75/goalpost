//
//  FinishGoalVC.swift
//  goalpost-app
//
//  Created by david.roff on 3/8/18.
//  Copyright © 2018 david.roff. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTxtField: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        pointsTxtField.delegate = self
    }
    
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        //pass data into core data goal model
    }
    
}
