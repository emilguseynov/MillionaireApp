//
//  WinOrLoseViewController.swift
//  MillionaireApp
//
//  Created by Дербе Эмма on 09.02.2023.
//

import UIKit

enum GameResult {
    case win
    case lose
    case moneyTaken
}

//MARK: - Properties
class WinLoseVC: UIViewController, Coordinating {
    var coordinator: GameCoordinator?
    
    private var smallResultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var bigResultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = .boldSystemFont(ofSize: 50)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var goToTheMainVCButton: UIButton = {
       let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 20
        button.setTitle("Menu", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 36)
        button.addTarget(self, action: #selector(goToTheMainVCPressed), for: .touchUpInside)
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

//MARK: - Configure method

extension WinLoseVC {
    
    func configure(with result: GameResult, moneyEarned: Int) {
        switch result {
        case .win:
            bigResultLabel.text = "GREAT!"
            smallResultLabel.text = "You won \(String(moneyEarned)) RUB"
        case .lose:
            bigResultLabel.text = "UNFORTUNATELY"
            smallResultLabel.text = "You earned \(String(moneyEarned)) RUB"
        case .moneyTaken:
            bigResultLabel.text = "GOT YOURSELF A LITTLE MONEY"
            smallResultLabel.text = "You earned \(String(moneyEarned)) RUB"
        }
    }
    
}
//MARK: - setupView
extension WinLoseVC {
    private func setupView() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "background")
            self.view.insertSubview(backgroundImage, at: 0)
        
        view.addSubview(logoGameImage)
        view.addSubview(goToTheMainVCButton)
        view.addSubview(bigResultLabel)
        view.addSubview(smallResultLabel)
    }
}

//MARK: - setConstraints
extension WinLoseVC {
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
            goToTheMainVCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goToTheMainVCButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -84),
            goToTheMainVCButton.heightAnchor.constraint(equalToConstant: 100),
            goToTheMainVCButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}

//MARK: - buttons actions (navigation for another controllers)
extension WinLoseVC {
    
    @objc func goToTheMainVCPressed (_ sender: UIButton) {
        coordinator?.start()
    }
}
