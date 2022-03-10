//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
//  Edited by Santiago Hernandez on Mar. 9, 2022


import UIKit

public var correctionString: String = ""

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var QuestionText: UILabel!
    
    @IBOutlet weak var TrueButton: UIButton!
    
    @IBOutlet weak var Falsebutton: UIButton!
    
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    
    
    public var brain = Brain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func BtnPressed(_ sender: UIButton) {
    
        if brain.isCorrect(usrAns: sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "CorrectionVC") as! CorrectionViewController
            
            correctionString = brain.questions[brain.turn].reasoning
            
            present(vc, animated: true)
        }
        
//        <-----Enhancement #1----->
//        Added new screen and sound effects if player gets all answers correct
//        more on ../Model/VictoryScreenController.swift
        if brain.score == brain.questions.count {
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
    

}
