//
//  Questions.swift
//  Quizzler-iOS13
//
//  Created by Santiago Hernandez on 3/9/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    
    let quiz: String
    let answer: String
    
    init(q: String, a: String) {
        quiz = q
        answer = a
    }
    
}
