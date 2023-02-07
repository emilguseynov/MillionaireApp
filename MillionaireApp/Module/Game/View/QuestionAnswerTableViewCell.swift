//
//  QuestionAnswerTableViewCell.swift
//  MillionaireApp
//
//  Created by Андрей Бородкин on 07.02.2023.
//

import UIKit

class QuestionAnswerTableViewCell: UITableViewCell {

    let backgroundImage     = UIImageView()
    let questionIDLabel     = UILabel()
    var questionID          = ""
    
    let questionAnswerLabel = UILabel()
    var questionAnswer      = ""
    
    let questionStack       = UIStackView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(questionStack)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(answer: Answer, index: Int) {
        questionAnswer = answer.text
        questionID = String(index)
    }

    func setupUI() {
        
        questionIDLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //questionIDLabel.text = questionID
        questionIDLabel.font = .systemFont(ofSize: 20, weight: .bold)
        questionIDLabel.textColor = .black
        
        
       questionAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
       
       //questionAnswerLabel.text = questionID
       questionAnswerLabel.font = .systemFont(ofSize: 20, weight: .bold)
       questionAnswerLabel.textColor = .black
        
        
        questionStack.axis = .horizontal
        questionStack.distribution = .equalSpacing
        //topStackView.spacing = 20
        
        questionStack.addArrangedSubview(questionIDLabel)
        questionStack.addArrangedSubview(questionAnswerLabel)
        
        questionStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionStack.topAnchor.constraint(equalTo: self.topAnchor),
            questionStack.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -20),
            questionStack.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            questionStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}
