//
//  WinGameVC.swift
//  MillionaireApp
//
//  Created by Дербе Эмма on 11.02.2023.
//

import UIKit

//MARK: - Properties

class WinGameVC: UIViewController, Coordinating {
    var coordinator: GameCoordinator?
    
    var dataFetch: DataFetch?
    var questionArray: Questions?
    
    private var smallResultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "You win attempt"
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var bigResultLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorList.accentOrange
        label.text = "WIN"
        label.font = .boldSystemFont(ofSize: 50)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var playAgainButton: UIButton = {
       let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = ColorList.accentGreen
        button.layer.cornerRadius = 20
        button.setTitle("Play again", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 36)
        button.addTarget(self, action: #selector(playAgainGamePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let logoGameImage: UIImageView = {
       let image = UIImageView(image: UIImage(named: "Logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
//  MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
}

//MARK: - setupView
extension WinGameVC {
    private func setupView() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "background")
            self.view.insertSubview(backgroundImage, at: 0)
        
        view.addSubview(logoGameImage)
        view.addSubview(playAgainButton)
        view.addSubview(bigResultLabel)
        view.addSubview(smallResultLabel)
    }
}

//MARK: - setConstraints
extension WinGameVC {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            logoGameImage.widthAnchor.constraint(equalToConstant: 201),
            logoGameImage.heightAnchor.constraint(equalToConstant: 201),
            logoGameImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoGameImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            smallResultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            smallResultLabel.topAnchor.constraint(equalTo: logoGameImage.bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            bigResultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bigResultLabel.topAnchor.constraint(equalTo: logoGameImage.bottomAnchor, constant: 47),
        ])
        
        NSLayoutConstraint.activate([
            playAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playAgainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -84),
            playAgainButton.heightAnchor.constraint(equalToConstant: 100),
            playAgainButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}

//MARK: - buttons actions (navigation for another controllers)
extension WinGameVC {
    
    @objc func playAgainGamePressed (_ sender: UIButton) {
        coordinator?.showRules()
        print("1")
    }
}

