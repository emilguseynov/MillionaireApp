//
//  QuestionAnswerTableViewCell.swift
//  MillionaireApp
//
//  Created by Андрей Бородкин on 07.02.2023.
//

import UIKit

class QuestionAnswerTableViewCell: UITableViewCell {

    let backgroundImageView = UIImageView()
    
    let questionIDLabel     = UILabel()
    let questionAnswerLabel = UILabel()
    
    let questionStack       = UIStackView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundImageView.addSubview(questionIDLabel)
        backgroundImageView.addSubview(questionAnswerLabel)
        setupUI()
        
        
        backgroundColor = .clear
        layer.borderColor = UIColor.black.cgColor
        //layer.borderWidth = 1
        //layer.cornerRadius = 9
        //clipsToBounds = true
        layer.masksToBounds = false
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 1
        layer.cornerRadius = 5
        layer.shadowOffset = CGSize(width: 10, height: 30)

        
        contentView.backgroundColor = .white
            contentView.layer.cornerRadius = 10
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
        
        questionIDLabel.translatesAutoresizingMaskIntoConstraints = false
        
        questionIDLabel.font = .systemFont(ofSize: 20, weight: .bold)
        questionIDLabel.textColor = .white
        
        
        questionAnswerLabel.translatesAutoresizingMaskIntoConstraints = false

        questionAnswerLabel.font = .systemFont(ofSize: 20, weight: .bold)
        questionAnswerLabel.textColor = .white
        
        
        backgroundImageView.image = UIImage(named: "buttonWithShadow")
        backgroundImageView.contentMode = .scaleToFill
        contentView.addSubview(backgroundImageView)
        backgroundImageView.frame = bounds
        
        
        NSLayoutConstraint.activate([
            questionIDLabel.topAnchor.constraint(equalTo: topAnchor),
            questionIDLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            questionIDLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            questionIDLabel.heightAnchor.constraint(equalToConstant: 20),
            questionIDLabel.widthAnchor.constraint(equalToConstant: 20),
            
            questionAnswerLabel.topAnchor.constraint(equalTo: topAnchor),
            questionAnswerLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            questionAnswerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            questionAnswerLabel.heightAnchor.constraint(equalToConstant: 20),
            questionAnswerLabel.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
}
