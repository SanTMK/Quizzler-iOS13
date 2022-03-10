//
//  Brain.swift
//  Quizzler-iOS13
//
//  Created by Santiago Hernandez on 3/9/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Brain {
    
    var turn: Int = 0
    var score: Int = 0
    
    let questions: [Question] = [Question(q: "A slug's blood is green.", a: "True", r: "The proteins in slug blood carry COPPER atoms instead of iron. They too attract oxygen. The copper gives the blood a bluish green color."),
                                 Question(q: "Approximately one quarter of human bones are in the feet.", a: "True", r: "Each foot is made up of 26 bones, 30 joints and more than 100 muscles, tendons and ligaments, all of which work together to provide support, balance and mobility."),
                                 Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True", r: "Your lungs are one of the largest organs in your body. The surface area of both lungs is roughly the same size as a tennis court and the total length of the airways running through them is 1,500 miles. That's about the distance from Chicago to Las Vegas."),
                                 Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True", r: "Under West Virginia state code §20-2-4 it is legal to take home and eat roadkill. Jeff Eberbaugh's Gourmet Style Road Kill Cooking was a runaway success in West Virginia when it was published in 1991."),
                                 Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False", r: "However, the Law Commission’s Statute Law Repeals team, which has been responsible for rescinding 2,000 outdated laws since 1965, asserts that it is not illegal to die in the Houses of Parliament."),
                                 Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True", r: "Portugal has taken the “don’t pee in the pool” rule to a whole other level by making it illegal for anyone to pee in the ocean."),
                                 Question(q: "You can lead a cow down stairs but not up stairs.", a: "False", r: "So, yes, cows can walk down stairs. They just avoid the situation as much as possible, as they are not evolutionarily prepared for such steep slopes and foreign leg movements."),
                                 Question(q: "Google was originally called 'Backrub'.", a: "True", r: "According to Stanford's David Koller and Google's website, when the two ran the original program, they did it under the name, “BackRub.” It was a reference to the back links. Using back links allowed Brin and Page's search engine to find more relevant web pages."),
                                 Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True", r: "His mother, Marion Moon, was the daughter of an Army chaplain. His father, Edwin Eugene Aldrin, was a Colonel in the U.S. Air Force"),
                                 Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False", r:"The loudest animal in the world is the blue whale: its vocalisations of up to 188 decibels can be heard 160km away."),
                                 Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False", r: "A piece of paper can, in fact, be folded more than 7 times. It has been done many times in many places all around the world."),
                                 Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True", r: "Chocolate is poisonous to dogs mostly because of its theobromine content, which dogs are unable to metabolize effectively.")]
    
    func getQuestion() -> String {
        return questions[turn].quiz
    }
    
    func getProgress() -> Float {
        return Float(turn) / Float(questions.count)
    }
    
    mutating func nextQuestion() {
        if turn < questions.count - 1 {
            turn += 1
        } else {
            turn = 0
        }
    }
    
    mutating func isCorrect (usrAns: String) -> Bool {
        
        if usrAns == questions[turn].answer {
            score += 1
            return true
        } else {
            return false
        }
        
    }
}
