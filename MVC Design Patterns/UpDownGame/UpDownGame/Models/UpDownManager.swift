//
//  UpDownManager.swift
//  UpDownGame
//
//  Created by 양귀현 on 7/3/24.
//

import Foundation


struct UpDownManager {
    private var comNumber = Int.random(in: 1...10)
    
    private var myNumber: Int = 1
    
    mutating func resetNum() {
        comNumber = Int.random(in: 1...10)
        myNumber = 1
    }
    
    mutating func setUsersNum(num: Int) {
        myNumber = num
    }
    
    func getUpDownResult() -> String {
        if (myNumber < comNumber) {
            return "⬆️ UP ⬆️"
        } else if (myNumber > comNumber) {
            return "⬇️ DOWN ⬇️"
        } else {
            return "😎 BINGO 😎"
        }
    }
}
