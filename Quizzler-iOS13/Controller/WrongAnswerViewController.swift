//
//  WrongAnswerViewController.swift
//  Quizzler-iOS13
//
//  Created by Santiago Hernandez on 3/9/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class WrongAnswerViewController: UIViewController {

    
    @IBOutlet weak var CorrectionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.7490196078, green: 0.3058823529, blue: 0.1882352941, alpha: 1)

        // Do any additional setup after loading the view.
    }

    @objc public func displayCorrection(r: String) {
        CorrectionLabel.text = r
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
