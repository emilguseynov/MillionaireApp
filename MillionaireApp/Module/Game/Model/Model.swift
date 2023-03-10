//
//  Model.swift
//  MillionaireApp
//
//  Created by Emil Guseynov on 06.02.2023.
//

import Foundation


struct Question: Decodable {
    let text: String
    let price: Int
    let isSafeHaven: Bool
    var answers: [Answer]
}

struct Answer: Decodable {
    let text: String
    let isRight: Bool
}

typealias Questions = [Question]
