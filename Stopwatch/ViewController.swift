//
//  ViewController.swift
//  Timer
//
//  Created by Dmitriy Baranoff on 08/11/2019.
//  Copyright © 2019 freedevelopers.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var startView: UIButton!
    @IBOutlet var pauseView: UIButton!
    @IBOutlet var restartView: UIButton!
    
    var timer = Timer()
    var counter = 0
    var seconds = 0
    var minutes = 0
    var hours = 0

    @IBOutlet var timerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timerLabel.text = "00:00:00"
        startView.layer.cornerRadius = 5;
        startView.layer.masksToBounds = true;
        
        pauseView.layer.cornerRadius = 5;
        pauseView.layer.masksToBounds = true;
        
        restartView.layer.cornerRadius = 5;
        restartView.layer.masksToBounds = true;
    }
    
    
    @IBAction func startBtn(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func pauseBtn(_ sender: Any) {
        timer.invalidate() // pause
    }
    
    
    @IBAction func restartBtn(_ sender: Any) {
        timer.invalidate()
        counter = 0
        timerLabel.text = "00:00:00"
    }
    
    @objc func updateTimer() {
        
        counter += 1
       
        hours = counter / 3600
        minutes = (counter % 3600) / 60
        seconds = (counter % 3600) % 60
        
            
        if (seconds <= 9 && minutes <= 9 && hours <= 9) {
            timerLabel.text = "0\(hours):0\(minutes):0\(seconds)"
        }
        
        if (seconds <= 9 && minutes > 9 && hours > 9) {
            timerLabel.text = "\(hours):\(minutes):0\(seconds)"
        }
        
        if (seconds <= 9 && minutes <= 9 && hours > 9) {
            timerLabel.text = "\(hours):0\(minutes):0\(seconds)"
        }
        
        if (seconds <= 9 && minutes > 9 && hours <= 9) {
            timerLabel.text = "0\(hours):\(minutes):0\(seconds)"
        }
        
        if (seconds > 9 && minutes > 9 && hours > 9) {
            timerLabel.text = "\(hours):\(minutes):\(seconds)"
        }
        
        if (seconds > 9 && minutes <= 9 && hours <= 9) {
            timerLabel.text = "0\(hours):0\(minutes):\(seconds)"
        }
        
        if (seconds > 9 && minutes > 9 && hours <= 9) {
            timerLabel.text = "0\(hours):\(minutes):\(seconds)"
        }
        
        if (seconds > 9 && minutes <= 9 && hours > 9) {
            timerLabel.text = "\(hours):0\(minutes):\(seconds)"
        }
        
        if(hours > 99) {
            counter = 0
        }
        

       
    }

}

