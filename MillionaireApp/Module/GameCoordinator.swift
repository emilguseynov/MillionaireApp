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
    var questionArr: [Question]!
    var questionNumber = 0
    var moneyEarned = 0
    var safeHavenMoney = 0
    
    func start() {
        let viewControoler = MainViewController()
        viewControoler.coordinator = self
        navigationController?.setViewControllers([viewControoler], animated: false)
        questionNumber = 0
        safeHavenMoney = 0
        moneyEarned = 0
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
    
    func selectedAnswer(isRight: Bool) {
        
        SoundClass.playSound(resource: .intrigue)
        
        if let gameVC = navigationController?.viewControllers.last as? GameMainVC {
            gameVC.view.isUserInteractionEnabled = false
            navigationController?.navigationBar.isUserInteractionEnabled = false
            gameVC.timer.invalidate()

        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            SoundClass.stopSound()
            
            if isRight {
                let questionListVC = QuestionsListViewController()
                questionListVC.currentQuestion = self.questionArr.count - (self.questionNumber + 1)
                self.navigationController?.pushViewController(questionListVC, animated: true)
                
                if self.questionNumber == 14 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        self.presentWinLoseScreen(with: .win)
                        SoundClass.playSound(resource: .won)
                        return
                    }
                } else {
                    self.questionNumber += 1
                    self.moneyEarned = qlist[qlist.count - self.questionNumber].amount
                    
                    if self.questionArr[self.questionNumber - 1].isSafeHaven {
                        self.safeHavenMoney = self.moneyEarned
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.dismissPresentedVC()
                    }
                }
            } else {
                self.presentWinLoseScreen(with: .lose)
            }
        }
    }
    
    func backButtonTapped() {
        questionNumber = 0
    }
    
    func presentWinLoseScreen(with result: GameResult) {
        let winLoseVC = WinLoseVC()
        winLoseVC.coordinator = self
        
        switch result {
        case .lose:
            winLoseVC.configure(with: result, moneyEarned: safeHavenMoney)
            SoundClass.playSound(resource: .answerIsWrong)
        case .moneyTaken:
            winLoseVC.configure(with: result, moneyEarned: moneyEarned)
            SoundClass.playSound(resource: .answerIsWrong)
        case .win:
            winLoseVC.configure(with: result, moneyEarned: moneyEarned)
            SoundClass.playSound(resource: .won)
        }
        navigationController?.pushViewController(winLoseVC, animated: true)
    }
    
    //  MARK: - Private methods
    
    private func presentGameVCWithQuestion(questionNumber: Int) {
        
        if let question = questionArr?[questionNumber] {
            var mixedAnswersQuestion = question
            mixedAnswersQuestion.answers = question.answers.shuffled()
            
            let gameVC = GameMainVC(
                question: mixedAnswersQuestion,
                questionNumber: questionNumber)
            gameVC.coordinator = self
            self.navigationController?.pushViewController(gameVC, animated: true)
        }
    }
    
    func updateQuestion() -> (question: Question, questionNumber: Int) {
        
        if questionNumber >= 15 {
            presentWinLoseScreen(with: .win)
            return(Question(text: "", price: 0, isSafeHaven: false, answers: [Answer(text: "", isRight: false)]), 0)
        } else {
            guard let question = questionArr?[questionNumber] else {return
                (Question(
                    text: "",
                    price: 0,
                    isSafeHaven: false,
                    answers: [Answer(text: "", isRight: false)]),
                 0)
            }
            var mixedAnswersQuestion = question
            mixedAnswersQuestion.answers = question.answers.shuffled()
            return (mixedAnswersQuestion, questionNumber)

        }
        
        
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
