//
//  HelpAlertController.swift
//  MillionaireApp
//
//  Created by Emil Guseynov on 09.02.2023.
//

import UIKit

class HelpAlertController: UIAlertController {
    
    var rightAnswer: Answer!
    var wrongAnswer: Answer!
    
    
    convenience init(answers: [Answer] = [], helpType: HelpType, isUsed: Bool) {
        self.init(title: nil, message: nil, preferredStyle: .alert)
        
        if isUsed {
            title = "Вы уже использовали эту подсказку"
        } else {
            setupIfAvailable(answers, helpType)
        }
        addAction(UIAlertAction(title: "Ок", style: .cancel))
    }
    
    private func setupIfAvailable(_ answers: [Answer], _ helpType: HelpAlertController.HelpType) {
        
        wrongAndRight(from: answers)
        
        let chanceNumber = Int.random(in: 0...10)
        
        switch helpType {
        case .audienceHelp:
            title = "Зрители считают что"
            if chanceNumber <= 8 {
                message = "правильный ответ \(rightAnswer.text)"
            } else {
                message = "правильный ответ \(wrongAnswer.text)"
            }
        case .callAFriend:
            title = "Ваш друг считает что"
            if chanceNumber <= 7 {
                message = "правильный ответ \(rightAnswer.text)"
            } else {
                message = "правильный ответ \(wrongAnswer.text)"
            }
        }
    }
    
    func wrongAndRight(from answers: [Answer], completion: ((Answer, Answer) -> ())? = nil) {
        for i in answers {
            if i.isRight {
                rightAnswer = i
            } else {
                wrongAnswer = i
            }
        }
        completion?(rightAnswer, wrongAnswer)
    }
    
    
    enum HelpType {
        case audienceHelp
        case callAFriend
    }
}
