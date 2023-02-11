//
//  WinOrLoseViewController.swift
//  MillionaireApp
//
//  Created by Дербе Эмма on 09.02.2023.
//

import UIKit

//MARK: - Properties
class LoseGameVC: UIViewController, Coordinating {
    var coordinator: GameCoordinator?
    var dataFetch: DataFetch?
    var questionArray: Questions?
    
    private var smallResultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "You losed attempt"
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var bigResultLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorList.accentOrange
        label.text = "LOSE"
        label.font = .boldSystemFont(ofSize: 50)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var goToTheMainVCButton: UIButton = {
       let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = ColorList.accentGreen
        button.layer.cornerRadius = 20
        button.setTitle("Play again", for: .normal)
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

//MARK: - setupView
extension LoseGameVC {
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
extension LoseGameVC {
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
extension LoseGameVC {
    
    @objc func goToTheMainVCPressed (_ sender: UIButton) {
        coordinator?.goToTheMainVC()
    }
}
