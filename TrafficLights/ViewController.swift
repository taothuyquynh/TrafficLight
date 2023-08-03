//
//  ViewController.swift
//  TrafficLights
//
//  Created by Tao Quynh on 8/3/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    
    var tempTimer: Int = 0 {
        didSet {
            self.timerLabel.text = String(format: "%02d", tempTimer)
            
            if tempTimer == 0 {
                redLight.backgroundColor = .gray
                yellowLight.backgroundColor = .gray
                greenLight.backgroundColor = .gray
            }
        }
    }
    var lightState: LightState = .red {
        didSet {
            switch lightState {
            case .red:
                redLight.backgroundColor = .red
                yellowLight.backgroundColor = .gray
                greenLight.backgroundColor = .gray
                tempTimer = Time.RED_TIMER
            case .yellow:
                redLight.backgroundColor = .gray
                yellowLight.backgroundColor = .yellow
                greenLight.backgroundColor = .gray
                tempTimer = Time.YELLOW_TIMER
            case .green:
                redLight.backgroundColor = .gray
                yellowLight.backgroundColor = .gray
                greenLight.backgroundColor = .green
                tempTimer = Time.GREEN_TIMER
            }
        }
    }
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lightState = .red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        redLight.layer.cornerRadius = redLight.bounds.height / 2
        yellowLight.layer.cornerRadius = redLight.bounds.height / 2
        greenLight.layer.cornerRadius = redLight.bounds.height / 2
        
        lightState = .red
        startTrafficLights()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        timer.invalidate()
        lightState = .red
        tempTimer = 0
    }
    
    private func startTrafficLights() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func runTimer() {
        updateTimer()
    }
    
    func updateTimer() {
        tempTimer -= 1
        switch lightState {
        case .red:
            if tempTimer < 0 {
                lightState = .yellow
            }
        case .yellow:
            if tempTimer < 0 {
                lightState = .green
            }
        case .green:
            if tempTimer < 0 {
                lightState = .red
            }
        }
        
    }
    
    @IBAction func onSettingTimer(_ sender: Any) {
        let settingVC = SettingTimerViewController()
        settingVC.modalPresentationStyle = .fullScreen
        self.present(settingVC, animated: true)
    }
}

