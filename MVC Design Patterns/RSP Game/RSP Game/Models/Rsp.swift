//
//  RSP.swift
//  RSP Game
//
//  Created by 양귀현 on 6/20/24.
//

import UIKit

enum Rsp : Int{
    case ready
    case rock
    case paper
    case scissors
    
    var rspInfo: (image: UIImage, name: String) {
        switch self {
        case .ready:
            return (#imageLiteral(resourceName: "ready"), "준비")
        case .rock:
            return (#imageLiteral(resourceName: "rock"), "바위")
        case .scissors:
            return (#imageLiteral(resourceName: "scissors"), "가위")
        case .paper:
            return (#imageLiteral(resourceName: "paper"), "보")
        }
    }
}
