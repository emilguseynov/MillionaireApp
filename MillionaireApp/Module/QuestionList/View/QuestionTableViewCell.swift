//
//  QuestionTableViewCell.swift
//  MillionaireApp
//
//  Created by User on 06.02.2023.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    static let identifier = "QuestionTableViewCell"
    
    lazy var bgView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        view.layer.cornerRadius = 15
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        return label
    }()
    
    lazy var amountLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Amount"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        bgView.addSubview(titleLabel)
        bgView.addSubview(amountLabel)
        
        addSubview(bgView)
        
        NSLayoutConstraint.activate([
            bgView.centerYAnchor.constraint(equalTo: centerYAnchor),
            bgView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            bgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: bgView.trailingAnchor),
            bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: 4)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: amountLabel.trailingAnchor, constant: 16),
            amountLabel.centerYAnchor.constraint(equalTo: bgView.centerYAnchor)
        ])
    }
}
