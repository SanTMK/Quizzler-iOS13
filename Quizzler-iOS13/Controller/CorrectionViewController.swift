//
//  CorrectionViewController.swift
//  Quizzler-iOS13
//
//  Created by Santiago Hernandez on 3/9/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class CorrectionViewController: UIViewController {

    @IBOutlet weak var CorrectionText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CorrectionText.text = correctionString
        
        // Do any additional setup after loading the view.
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
