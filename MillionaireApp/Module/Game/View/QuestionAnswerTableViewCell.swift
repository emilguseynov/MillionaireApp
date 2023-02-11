//
//  QuestionAnswerTableViewCell.swift
//  MillionaireApp
//
//  Created by Андрей Бородкин on 07.02.2023.
//

import UIKit

class QuestionAnswerTableViewCell: UITableViewCell {

    let backgroundImageView = UIImageView(image: UIImage(named: "buttonWithShadow"))
    
    let questionIDLabel     = UILabel()
    let questionAnswerLabel = UILabel()
    
    let questionStack       = UIStackView()
    
    let inset: CGFloat = 22
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
               
        setupUI()
    }
    
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(answer: Answer, index: Int) {
        
        let idLabelText: String
        
        switch index {
        case 0: idLabelText = "A"
        case 1: idLabelText = "B"
        case 2: idLabelText = "C"
        case 3: idLabelText = "D"
        default: idLabelText = "?"
        }
        
        questionAnswerLabel.text = answer.text
        questionIDLabel.text = idLabelText
    }

    func setupUI() {
        
        addSubview(questionIDLabel)
        addSubview(questionAnswerLabel)
        
        self.backgroundView = backgroundImageView
        backgroundColor = .clear
              
                   
        questionIDLabel.translatesAutoresizingMaskIntoConstraints = false
        questionIDLabel.font = .systemFont(ofSize: 20, weight: .bold)
        questionIDLabel.textColor = .white
        
        questionAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        questionAnswerLabel.font = .systemFont(ofSize: 20, weight: .bold)
        questionAnswerLabel.textColor = .white
        

        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionIDLabel.topAnchor.constraint(equalTo: backgroundImageView.topAnchor),
            questionIDLabel.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -10),
            questionIDLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: inset-10),
            questionIDLabel.heightAnchor.constraint(equalToConstant: 20),
            questionIDLabel.widthAnchor.constraint(equalToConstant: 20),
            
            questionAnswerLabel.topAnchor.constraint(equalTo: backgroundImageView.topAnchor),
            questionAnswerLabel.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -10),
            questionAnswerLabel.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -inset),
            questionAnswerLabel.heightAnchor.constraint(equalToConstant: 20),
            
            
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
