//
//  HelpAlertController.swift
//  MillionaireApp
//
//  Created by Emil Guseynov on 09.02.2023.
//

import UIKit

class HelpAlertController: UIAlertController {
    convenience init(answer: String = "", helpType: HelpType, isUsed: Bool) {
        self.init(title: nil, message: nil, preferredStyle: .alert)
        
        if isUsed {
            self.title = "Вы уже использовали эту подсказку"
        } else {
            switch helpType {
            case .audienceHelp:
                self.title = "Зрители считают что"
            case .callAFriend:
                self.title = "Ваш друг считает что"
            }
            self.message = "правильный ответ: \(answer)"
        }
        
        addAction(
            UIAlertAction(
                title: "Ок",
                style: .cancel))
        
    }
    
    
    
    enum HelpType {
        case audienceHelp
        case callAFriend
    }
}
