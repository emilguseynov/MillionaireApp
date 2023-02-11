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
        print("2")
    }
    
    func playAgain() {
        print("3")
    }

    
    func selectedAnswer(isRight: Bool) {
        if isRight {
            let questionListVC = QuestionsListViewController()
            navigationController?.pushViewController(questionListVC, animated: true)
            
            // need setup questionListVC to highlight just answered question with green color
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.presentGameVCWithQuestion(questionNumber: self.questionNumber)
            }
        } else {
            // create and present loser screen
//           startGame()
            let loseGameVC = LoseGameVC()
            navigationController?.pushViewController(loseGameVC, animated: true)
        }
    }
    
    private func presentGameVCWithQuestion(questionNumber: Int) {
        
        if questionNumber >= 15 {
            
            let winGameVC = WinGameVC()
            navigationController?.pushViewController(winGameVC, animated: true)
            
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
    
}

protocol Coordinating {
    var coordinator: GameCoordinator? { get set }
}
