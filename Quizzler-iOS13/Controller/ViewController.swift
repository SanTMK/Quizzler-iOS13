//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
//  Edited by Santiago Hernandez on Mar. 9, 2022

// Enhancements:
// #1 Added two screens: one for completion of the game with a perfect score, and a second one that displays the reason why an answer is wrong
// #2 Added a time limit progress bar set to give the player a 60 second limit to answer all the questions or their attempt will be over.


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

    //Variables for time limit bar
    var timeRemaining = 60
    var timer: Timer!
    
    public var brain = Brain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        <-----Enhancement#2----->
        //        second prograss bar, this one determines the time remaining before answer is counted as wrong. See step() below for more details.
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
        
        updateUI()
    }

    @IBAction func BtnPressed(_ sender: UIButton) {
        
    
        if brain.isCorrect(usrAns: sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
            
//        <-----Enhancement #1----->
//        Added new screen if player gets all answers correct
//        more on Brain.questions[].r struct and ../Model/VictoryScreenController.swift
            
//            Incorrect answer brings up reasoning screen
            let vc = storyboard?.instantiateViewController(withIdentifier: "CorrectionVC") as! CorrectionViewController
            
            correctionString = brain.questions[brain.turn].reasoning
            
            present(vc, animated: true)
        }
        
//        Check for perfect score
        if brain.score == brain.questions.count {
            
            timer.invalidate()
            
//            call VictoryScreenController
            let vc = storyboard?.instantiateViewController(withIdentifier: "victoryVC") as! VictoryScreenController
            
            present(vc, animated: true)
        }
    
        brain.nextQuestion()
        ProgressBar.progress = brain.getProgress()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        

    }
    
    @objc func updateUI() {
        QuestionText.text = brain.getQuestion()
        
        if QuestionText.text == brain.questions[0].quiz {
            brain.score = 0
        }
            
        ScoreLabel.text = "Score: \(brain.score)"
            
        TrueButton.backgroundColor = UIColor.clear
        Falsebutton.backgroundColor = UIColor.clear
    }
    
    // Updates seconds remaining, progress bar and launches correction screen if time reaches zero
    @objc func step() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            timer.invalidate()
            timeRemaining = 10
            
            //Show Correction screen (copy-pasted from above)
            let vc = storyboard?.instantiateViewController(withIdentifier: "TimesUpVC") as! TimesUpViewController

            
            present(vc, animated: true)
            
            
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            
            
        }
        // update bar
        
        TimeRemainingProgressBar.progress = Float(timeRemaining) / Float(60)
        
    }
    
    
    
}
