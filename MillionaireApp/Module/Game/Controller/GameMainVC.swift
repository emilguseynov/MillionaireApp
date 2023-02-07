//
//  GameMainVC.swift
//  MillionaireApp
//
//  Created by Андрей Бородкин on 05.02.2023.
//

import UIKit
import SwiftUI


struct Question {
    var text: String
    var answers: [Answer]
    
    static    func fetchQuestions() -> [Question] {
        return [
        Question(text: "What year was the year, when first deodorant was invented in our life?", answers: [
        Answer(text: "1956", isRight: true),
        Answer(text: "1912", isRight: false),
        Answer(text: "1942", isRight: false),
        Answer(text: "1930", isRight: false)
        ]),
        Question(text: "What year was the year, when first deodorant was invented in our life?", answers: [
        Answer(text: "1956", isRight: true),
        Answer(text: "1912", isRight: false),
        Answer(text: "1942", isRight: false),
        Answer(text: "1930", isRight: false)
        ])]
    }
}

struct Answer {
    var text: String
    var isRight: Bool
}


class GameMainVC: UIViewController {

  
    
        
    // MARK: - Params definition
       
    
    
    let backgroundImage               = UIImageView()
              
    var questionTextLabel             = UILabel()
    let logoImageView                 = UIImageView()
    let topStackView                  = UIStackView()
              
    var questionNumberLabel           = UILabel()
    var questionCostLabel             = UILabel()
    let middleStackView               = UIStackView()
    
    
    let tableView: UITableView        = UITableView()
    let cellSpacing: CGFloat          = 10
    
    let eliminateTwoQuestionsButton   = UIButton()
    let audienceHelpButton            = UIButton()
    let callAFriendButton             = UIButton()
    let buttonSize                    = CGSize(width: 100, height: 80)
    let bottomStackView               = UIStackView()
    
    var questions: [Question]         = []
    var currentQuestionIndex: Int     = 1
    var currentQuestionCost: Int      = 500
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions = Question.fetchQuestions()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setupUI()
    }
    
    
    
    // MARK: - Method definitions
    

    
    
 }





// MARK: - TableView Setup
extension GameMainVC: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(QuestionAnswerTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor.clear
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: middleStackView.bottomAnchor, constant: 50),
            tableView.bottomAnchor.constraint(equalTo: bottomStackView.topAnchor, constant: -50),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        questions[currentQuestionIndex].answers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        cellSpacing
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! QuestionAnswerTableViewCell
        
        
       let radius = cell.contentView.layer.cornerRadius
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
        
        //cell.questionID = String(indexPath.row)
        
        cell.set(answer: questions[0].answers[indexPath.section], index: indexPath.section)
        //cell.questionAnswer = questions[0].answers[indexPath.row].text

        tableView.rowHeight = 60

        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = false
    }
    
    
}

//MARK: - UI Setup w/o TableView
extension GameMainVC {
    
    func setupUI() {
        
        configureBackgroundImageView()
        setTopStackView()
        setMiddleStackView()
        setBottomStackView()
        configureTableView()
        
    }
    
    func configureBackgroundImageView(){
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: "background")
        view.addSubview(backgroundImageView)
        backgroundImageView.frame = view.bounds
    }
    
    func configureLogoImageView() {
        //addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.image = UIImage(named: "Logo")
                
        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100)

        ])
    }
    
    func configureQuestionTextLabel() {
        questionTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        questionTextLabel.text = questions[0].text
        questionTextLabel.font = .systemFont(ofSize: 20, weight: .bold)
        questionTextLabel.textColor = .black
        questionTextLabel.textAlignment = .left
        questionTextLabel.lineBreakMode = .byWordWrapping
        questionTextLabel.numberOfLines = 0
        
    }
    
    func setTopStackView() {
        
        configureLogoImageView()
        configureQuestionTextLabel()
        
        
        view.addSubview(topStackView)
        
        topStackView.axis = .horizontal
        topStackView.distribution = .fillProportionally
        topStackView.spacing = 20
        
        topStackView.addArrangedSubview(logoImageView)
        topStackView.addArrangedSubview(questionTextLabel)
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    func configureQuestionNumberLabel() {
        questionNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        questionNumberLabel.text = String("Question \(currentQuestionIndex)")
        questionNumberLabel.font = .systemFont(ofSize: 20, weight: .bold)
        questionNumberLabel.textColor = .black
        }
    
    func configureQuestionCostLabel() {
        questionCostLabel.translatesAutoresizingMaskIntoConstraints = false
        
        questionCostLabel.text = String("\(currentQuestionCost) RUB")
        questionCostLabel.font = .systemFont(ofSize: 20, weight: .bold)
        questionCostLabel.textColor = .black
    }
    
    func setMiddleStackView() {
        
        configureQuestionNumberLabel()
        configureQuestionCostLabel()
        
        
        view.addSubview(middleStackView)
        
        middleStackView.axis = .horizontal
        middleStackView.distribution = .equalSpacing
        //topStackView.spacing = 20
        
        middleStackView.addArrangedSubview(questionNumberLabel)
        middleStackView.addArrangedSubview(questionCostLabel)
        middleStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            middleStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor,constant: 20),
            middleStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            middleStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
        
    
    func configureEliminateTwoQuestionsButton() {
        eliminateTwoQuestionsButton.setImage(ImageList.fifty, for: .normal)
        eliminateTwoQuestionsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eliminateTwoQuestionsButton.heightAnchor.constraint(equalToConstant: buttonSize.height),
            eliminateTwoQuestionsButton.widthAnchor.constraint(equalToConstant: buttonSize.width)
        ])
    }

    func configureAudienceHelpButton() {
        audienceHelpButton.setImage(ImageList.askTheAudience, for: .normal)
        audienceHelpButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            audienceHelpButton.heightAnchor.constraint(equalToConstant: buttonSize.height),
            audienceHelpButton.widthAnchor.constraint(equalToConstant: buttonSize.width)
        ])
    }
    
    
    func configureCallAFriendButton() {
        callAFriendButton.setImage(ImageList.phoneCall, for: .normal)
        callAFriendButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            callAFriendButton.heightAnchor.constraint(equalToConstant: buttonSize.height),
            callAFriendButton.widthAnchor.constraint(equalToConstant: buttonSize.width)
        ])
    }
    
    
    func setBottomStackView() {
        
        configureEliminateTwoQuestionsButton()
        configureAudienceHelpButton()
        configureCallAFriendButton()
        
        
        view.addSubview(bottomStackView)
        
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .equalSpacing
        //topStackView.spacing = 20
        
        bottomStackView.addArrangedSubview(eliminateTwoQuestionsButton)
        bottomStackView.addArrangedSubview(audienceHelpButton)
        bottomStackView.addArrangedSubview(callAFriendButton)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20),
            bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    
    
}

// MARK: - PreviewProvider
struct FlowProvider: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        
        let view = GameMainVC()
        func makeUIViewController(context: UIViewControllerRepresentableContext<FlowProvider.ContainterView>) -> GameMainVC {
            return view
        }
        
        func updateUIViewController(_ uiViewController: FlowProvider.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<FlowProvider.ContainterView>) {
            
        }
        
    }
    
}