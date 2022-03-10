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
        
        // Add text rationale text to label
        
        CorrectionText.text = correctionString
        
    }
    


}
