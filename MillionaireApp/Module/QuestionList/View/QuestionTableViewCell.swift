//
//  QuestionTableViewCell.swift
//  MillionaireApp
//
//  Created by User on 06.02.2023.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    static let identifier = "QuestionTableViewCell"
    
    lazy var bgImage: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bgBlue")
        image.layer.cornerRadius = 15
        image.contentMode = .scaleToFill
        
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        return label
    }()
    
    lazy var amountLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Amount"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
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
        bgImage.addSubview(titleLabel)
        bgImage.addSubview(amountLabel)
        
        addSubview(bgImage)
        
        NSLayoutConstraint.activate([
            bgImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            bgImage.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            bgImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: bgImage.trailingAnchor),
            bottomAnchor.constraint(equalTo: bgImage.bottomAnchor, constant: 4)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: bgImage.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: amountLabel.trailingAnchor, constant: 16),
            amountLabel.centerYAnchor.constraint(equalTo: bgImage.centerYAnchor)
        ])
    }
}
