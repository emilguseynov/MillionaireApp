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
    var moneyEarned = 0
    
    func start() {
        let viewControoler = MainViewController()
        viewControoler.coordinator = self
        navigationController?.setViewControllers([viewControoler], animated: false)
        questionNumber = 0
        
    }
    
    func startGame() {
        SoundClass.stopSound()
        dataFetch?.getQuestions(completion: { questions in
            self.questionArr = questions
            self.presentGameVCWithQuestion(questionNumber: 0)
        })
    }
    
    func showRules() {
        navigationController?.pushViewController(RulesViewController(), animated: true)
    }
    
    func goToTheMainVC() {
        start()
    }

    
    func selectedAnswer(isRight: Bool) {
        
        SoundClass.playSound(resource: .intrigue)
        
        if let gameVC = navigationController?.viewControllers.last as? GameMainVC {
            gameVC.tableView.isUserInteractionEnabled = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            SoundClass.stopSound()
            if isRight {
                let questionListVC = QuestionsListViewController()
                self.navigationController?.pushViewController(questionListVC, animated: true)
                self.questionNumber += 1
                
                self.moneyEarned += qlist[qlist.count-self.questionNumber].amount
                
                // need setup questionListVC to highlight just answered question with green color
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    
                    self.dismissPresentedVC()
                    //self.presentGameVCWithQuestion(questionNumber: self.questionNumber)
                }
            } else {
                // create and present loser screen
                SoundClass.playSound(resource: .answerIsWrong)
                self.start()
            }

        } else {
            let loseGameVC = LoseGameVC()
            loseGameVC.coordinator = self
            navigationController?.pushViewController(loseGameVC, animated: true)

        }
        
        
    }
    
    func backButtonTapped() {
        questionNumber = 0
    }
    
    func goToWinnerScreen(questionsAnswered: Int, moneyWon: Int) {
        
        // to be implemented
    }
    
    //  MARK: - Private methods
    
    private func presentGameVCWithQuestion(questionNumber: Int) {
        

        if questionNumber >= 15 {
            
            let winGameVC = WinGameVC()
            winGameVC.coordinator = self
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
    
    
    func updateQuestion() -> (question: Question, questionNumber: Int) {
        print("updateQuestion method called")
        
        guard let question = questionArr?[questionNumber] else {return
            (Question(text: "Error", price: 0, answers: [Answer(text: "Error", isRight: false)]), 999)
        }
        if questionNumber >= 15 {
            //  create and present winner screen
            goToWinnerScreen(questionsAnswered: 15, moneyWon: moneyEarned)
            start()
        }
        
        var mixedAnswersQuestion = question
        mixedAnswersQuestion.answers = question.answers.shuffled()
        return (mixedAnswersQuestion, questionNumber)
        
        
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
