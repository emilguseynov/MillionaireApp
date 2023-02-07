//
//  MainViewController.swift
//  MillionaireApp
//
//  Created by Emil Guseynov on 05.02.2023.
//

import UIKit

//MARK: - objects and ViewDidLoad

class MainViewController: UIViewController {
    private var welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Welcome"
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var gamesNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "to Who Wants to be a Millionare"
        label.font = .boldSystemFont(ofSize: 36)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var startGame: UIButton = {
       let button = UIButton()
        button.setTitleColor(#colorLiteral(red: 0.3739845157, green: 0.8933092952, blue: 0.7061889768, alpha: 1), for: .normal)
        button.setTitle("Start Game", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 32)
        button.addTarget(self, action: #selector(startGamePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var gamesRules: UIButton = {
       let button = UIButton()
        button.setTitleColor(#colorLiteral(red: 0.3739845157, green: 0.8933092952, blue: 0.7061889768, alpha: 1), for: .normal)
        button.setTitle("Правила игры", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 32)
        button.addTarget(self, action: #selector(gamesRulesPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let logoGameImage: UIImageView = {
       let image = UIImageView(image: UIImage(named: "Logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
}

//MARK: - setupView
extension MainViewController {
    private func setupView() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "background")
            self.view.insertSubview(backgroundImage, at: 0)
        
        view.addSubview(logoGameImage)
        view.addSubview(gamesRules)
        view.addSubview(startGame)
        view.addSubview(gamesNameLabel)
        view.addSubview(welcomeLabel)
    }
}

//MARK: - setConstraints
extension MainViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            logoGameImage.widthAnchor.constraint(equalToConstant: 225),
            logoGameImage.heightAnchor.constraint(equalToConstant: 225),
            logoGameImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoGameImage.bottomAnchor.constraint(equalTo: welcomeLabel.topAnchor, constant: -17)
        ])
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.bottomAnchor.constraint(equalTo: gamesNameLabel.topAnchor, constant: -9)
        ])
        
        NSLayoutConstraint.activate([
            gamesNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gamesNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gamesNameLabel.widthAnchor.constraint(equalToConstant: 280),
        ])
        
        NSLayoutConstraint.activate([
            startGame.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startGame.bottomAnchor.constraint(equalTo: gamesRules.topAnchor, constant: -43)
        ])
        
        NSLayoutConstraint.activate([
            gamesRules.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gamesRules.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -81)
        ])
    }
}

//MARK: - buttons actions (navigation for another controllers)
extension MainViewController {
    
    @objc func startGamePressed(_ sender: UIButton) {
//        let yourVC = yourViewController()
//        self.navigationController?.pushViewController(YOURVC, animated: true)
    
    }
    
    @objc func gamesRulesPressed(_ sender: UIButton) {
        let rulesVC = RulesViewController()
        self.navigationController?.pushViewController(rulesVC, animated: true)
    }
}
