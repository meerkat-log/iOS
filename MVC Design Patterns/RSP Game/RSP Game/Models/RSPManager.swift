//
//  RSPManager.swift
//  RSP Game
//
//  Created by 양귀현 on 7/3/24.
//

import Foundation

struct RSPManager {
    private var comChoice : Rsp = Rsp(rawValue: Int.random(in: 1...3))!
    private var userChoice : Rsp = Rsp(rawValue: Int.random(in: 1...3))!
    
    func getReady() -> Rsp {
        return Rsp.ready
    }
    
    func getUserRSP() -> Rsp {
        return userChoice
    }
    
    func getComputerRSP() -> Rsp {
        return comChoice
    }
    
    mutating func userGetSelected(name: String) {
        switch name {
        case "가위" :
            userChoice = Rsp.scissors
        case "바위" :
            userChoice = Rsp.rock
        case "보" :
            userChoice = Rsp.paper
        default:
            userChoice = Rsp.rock
        }
    }
    
    func getRpsResult() -> String {
        if comChoice == userChoice {
            return "비겼습니다🤔"
        } else if comChoice == .rock && userChoice == .paper {
            return "이겼습니다😙"
        } else if comChoice == .paper && userChoice == .scissors {
            return "이겼습니다😙"
        } else if comChoice == .scissors && userChoice == .rock {
            return "이겼습니다😙"
        } else {
            return "졌습니다😢"
        }
    }
    
    mutating func allReset() {
        comChoice = Rsp(rawValue: Int.random(in: 1...3))!
        userChoice = Rsp(rawValue: Int.random(in: 1...3))!
    }
}
