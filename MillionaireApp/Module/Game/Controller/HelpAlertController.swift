//
//  HelpAlertController.swift
//  MillionaireApp
//
//  Created by Emil Guseynov on 09.02.2023.
//

import UIKit

class HelpAlertController: UIAlertController {
    
    var rightAnswer = String()
    var wrongAnswer = String()
    
    
    convenience init(answers: [Answer], helpType: HelpType, isUsed: Bool) {
        self.init(title: nil, message: nil, preferredStyle: .alert)
        
        if isUsed {
            title = "Вы уже использовали эту подсказку"
        } else {
            setupIfAvailable(answers, helpType)
        }
        addAction(UIAlertAction(title: "Ок", style: .cancel))
    }
    
    private func setupIfAvailable(_ answers: [Answer], _ helpType: HelpAlertController.HelpType) {
        
        var wrongAnswers = [Any]()
        
        for i in answers {
            if i.isRight {
                rightAnswer = i.text
            } else {
                wrongAnswer = i.text
                wrongAnswers.append(i.text)
            }
        }
        
        let chanceNumber = Int.random(in: 0...10)
        
        switch helpType {
        case .audienceHelp:
            title = "Зрители считают что"
            if chanceNumber <= 8 {
                message = "правильный ответ \(rightAnswer)"
            } else {
                message = "правильный ответ \(wrongAnswer)"
            }
        case .callAFriend:
            title = "Ваш друг считает что"
            if chanceNumber <= 7 {
                message = "правильный ответ \(rightAnswer)"
            } else {
                message = "правильный ответ \(wrongAnswer)"
            }
        case .fiftyFifty:
            title = "Два неправильных ответа:"
            wrongAnswers.remove(at: (0...2).randomElement()!)
            message = "\(wrongAnswers.first!) и \(wrongAnswers.last!)"
           
        }
    }
    
    enum HelpType {
        case audienceHelp
        case callAFriend
        case fiftyFifty
    }
}
