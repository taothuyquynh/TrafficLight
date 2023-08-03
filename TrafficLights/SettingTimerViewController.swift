//
//  SettingTimerViewController.swift
//  TrafficLights
//
//  Created by Tao Quynh on 8/3/23.
//

import UIKit

class SettingTimerViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var yellowTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        redView.layer.cornerRadius = redView.bounds.height / 2
        yellowView.layer.cornerRadius = yellowView.bounds.height / 2
        greenView.layer.cornerRadius = greenView.bounds.height / 2
        
        redTextField.keyboardType = .numberPad
        yellowTextField.keyboardType = .numberPad
        greenTextField.keyboardType = .numberPad
    }

    @IBAction func onSave(_ sender: Any) {
        if let redText = redTextField.text, let redTime = Int(redText) {
            Time.RED_TIMER = redTime < 100 ? redTime : 99
        }
        
        if let yellowText = yellowTextField.text, let yellowTime = Int(yellowText) {
            Time.YELLOW_TIMER = yellowTime < 100 ? yellowTime : 99
        }
        
        if let greenText = yellowTextField.text, let greenTime = Int(greenText) {
            Time.GREEN_TIMER = greenTime < 100 ? greenTime : 99
        }
        
        self.dismiss(animated: true)
    }
    
}
