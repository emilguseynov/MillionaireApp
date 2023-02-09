//
//  GameCoordinator.swift
//  MillionaireApp
//
//  Created by Emil Guseynov on 08.02.2023.
//

import UIKit

class GameCoordinator {
    
    var navigationController: UINavigationController?
    
    var dataFetch: DataFetch?
    var questionArr: [Question]?
    var questionNumber = 0
    
    func start() {
        let viewControoler = MainViewController()
        viewControoler.coordinator = self
        navigationController?.setViewControllers([viewControoler], animated: false)
    }
    
    func startGame() {
        dataFetch?.getQuestions(completion: { questions in
            self.questionArr = questions
            self.presentGameVCWithQuestion(questionNumber: 0)
        })
    }
    
    func showRules() {
        navigationController?.pushViewController(RulesViewController(), animated: true)
    }
    
    func selectedAnswer(isRight: Bool) {
        if isRight {
            let questionListVC = QuestionsListViewController()
            navigationController?.pushViewController(questionListVC, animated: true) 
            self.questionNumber += 1
            // need setup questionListVC to highlight just answered question with green color
            
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                

                self.dismissPresentedVC()
                
                
              
                //self.presentGameVCWithQuestion(questionNumber: self.questionNumber)
            }
        } else {
            // create and present loser screen
           startGame()
        }
    }
    
    
    
    func updateQuestion() -> (question: Question, questionNumber: Int) {
        guard let question = questionArr?[questionNumber] else {return
            
            (Question(text: "Error", price: 0, answers: [Answer(text: "Error", isRight: false)]), 999)
        }
        
        if questionNumber >= 15 {
            
            //  create and present winner screen
            
            start()
        }
        
        var mixedAnswersQuestion = question
        mixedAnswersQuestion.answers = question.answers.shuffled()
        return (question, questionNumber)
        
      
    }
    
    
    
    //  MARK: - Private methods
    
    private func presentGameVCWithQuestion(questionNumber: Int) {
        
        if questionNumber >= 15 {
            
            //  create and present winner screen
            
            start()
            return
        }
        if let question = questionArr?[questionNumber] {
            var mixedAnswersQuestion = question
            mixedAnswersQuestion.answers = question.answers.shuffled()
            
            let gameVC = GameMainVC(
                question: mixedAnswersQuestion,
                questionNumber: questionNumber)
            gameVC.coordinator = self
            self.navigationController?.pushViewController(gameVC, animated: true)
        }
        
        self.questionNumber += 1
    }
    
    
    private func dismissPresentedVC() {
        guard let navigationController = self.navigationController else {return}
        var navigationArray = navigationController.viewControllers
        navigationArray.removeLast()
        
        self.navigationController?.viewControllers = navigationArray
    }
    
}

protocol Coordinating {
    var coordinator: GameCoordinator? { get set }
}
