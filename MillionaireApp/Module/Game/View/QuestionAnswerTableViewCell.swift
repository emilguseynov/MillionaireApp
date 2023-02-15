//
//  QuestionAnswerTableViewCell.swift
//  MillionaireApp
//
//  Created by Андрей Бородкин on 07.02.2023.
//

import UIKit

class QuestionAnswerTableViewCell: UITableViewCell {

    let questionIDLabel     = UILabel()
    let questionAnswerLabel = UILabel()
    var selectedAnswer: Answer?
    
    let questionStack       = UIStackView()
    
    let inset: CGFloat = 22
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
               
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            
            UIView.animate(withDuration: 0.2) { [self] in
                guard let selectedAnswer = selectedAnswer else {return}
                
                
                
                self.contentView.backgroundColor = .gray
                
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    
                    if selectedAnswer.isRight {
                        self.contentView.backgroundColor = .green
                    } else {
                        self.contentView.backgroundColor = .red
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now()+2){
                        self.contentView.backgroundColor = UIColor(named: "button-color")
                    }
                }
            }
            
        }
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(answer: Answer, index: Int) {
        selectedAnswer = answer
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
        
        backgroundColor = .clear
        
        contentView.backgroundColor = UIColor(named: "button-color")
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 3.0
        contentView.layer.borderColor = UIColor.darkGray.cgColor
        contentView.clipsToBounds = true
        contentView.layer.masksToBounds = false
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.shadowOpacity = 0.5
        
        contentView.addSubview(questionIDLabel)
        contentView.addSubview(questionAnswerLabel)
                           
        questionIDLabel.translatesAutoresizingMaskIntoConstraints = false
        questionIDLabel.font = .systemFont(ofSize: 20, weight: .bold)
        questionIDLabel.textColor = .white
        
        questionAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        questionAnswerLabel.font = .systemFont(ofSize: 20, weight: .bold)
        questionAnswerLabel.textColor = .white
        questionAnswerLabel.minimumScaleFactor = 0.2
        questionAnswerLabel.adjustsFontSizeToFitWidth = true
        

        NSLayoutConstraint.activate([
            questionIDLabel.topAnchor.constraint(equalTo: topAnchor),
            questionIDLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            questionIDLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset-10),
            questionIDLabel.heightAnchor.constraint(equalToConstant: 20),
            questionIDLabel.widthAnchor.constraint(equalToConstant: 20),
            
            questionAnswerLabel.topAnchor.constraint(equalTo: topAnchor),
            questionAnswerLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            questionAnswerLabel.leadingAnchor.constraint(greaterThanOrEqualTo: questionIDLabel.trailingAnchor),
            questionAnswerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            questionAnswerLabel.heightAnchor.constraint(equalToConstant: 20),
            
    
        ])
    }
}
