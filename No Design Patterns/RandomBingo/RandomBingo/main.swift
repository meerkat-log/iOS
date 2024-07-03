//
//  main.swift
//  RandomBingo
//
//  Created by 양귀현 on 6/25/24.
//

import Foundation


var computerChoice = Int.random(in: 1...100)
var myChoice: Int = 0


while computerChoice != myChoice {
    print("숫자:", terminator: " ")
    var userInput = readLine()

    if let input = userInput {
        if let number = Int(input) {
            myChoice = number
        }
    }

    if computerChoice > myChoice {
        print("Up")
    } else if computerChoice < myChoice {
        print("Down")
    } else {
        print("Bingo")
    }
}


