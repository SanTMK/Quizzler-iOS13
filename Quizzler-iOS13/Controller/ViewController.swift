//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
//  Edited by Santiago Hernandez on Mar. 9, 2022

// Enhancements:
// #1


import UIKit

// correctionString must be on global environment to be accessible form CorrectionViewController
var correctionString: String = ""

class ViewController: UIViewController {
    
    
    @IBOutlet weak var TimeRemainingProgressBar: UIProgressView!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var QuestionText: UILabel!
    
    @IBOutlet weak var TrueButton: UIButton!
    
    @IBOutlet weak var Falsebutton: UIButton!
    
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    var timeRemaining = 10
    var timer: Timer!
    
    public var brain = Brain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func BtnPressed(_ sender: UIButton) {
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, #selector(step), userInfo: nil, repeats: true)
        
        
        
        
    
        if brain.isCorrect(usrAns: sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
            
//        <-----Enhancement #1----->
//        Added new screen and sound effects if player gets all answers correct
//        more on Brain.questions[].r struct and ../Model/VictoryScreenController.swift
            
//            Incorrect answer brings up reasoning screen
            let vc = storyboard?.instantiateViewController(withIdentifier: "CorrectionVC") as! CorrectionViewController
            
            correctionString = brain.questions[brain.turn].reasoning
            
            present(vc, animated: true)
        }
        
//        Check for perfect score
        if brain.score == brain.questions.count {
            
//            call VictoryScreenController
            let vc = storyboard?.instantiateViewController(withIdentifier: "victoryVC") as! VictoryScreenController
            
            present(vc, animated: true)
        }
    
        brain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        

    }
    
    @objc func updateUI() {
            QuestionText.text = brain.getQuestion()
            ProgressBar.progress = brain.getProgress()
            ScoreLabel.text = "Score: \(brain.score)"
            
            TrueButton.backgroundColor = UIColor.clear
            Falsebutton.backgroundColor = UIColor.clear
    }
    
    @objc func step() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            timer.invalidate()
            timeRemaining = 10
        }
        
    }
    
    
    
}
