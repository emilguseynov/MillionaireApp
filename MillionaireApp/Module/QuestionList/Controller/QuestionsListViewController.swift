//
//  QuestionsListViewController.swift
//  MillionaireApp
//
//  Created by User on 06.02.2023.
//

import UIKit

class QuestionsListViewController: UIViewController {
    
    var currentQuestion = 14
    
    // Background
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "background")
        
        return image
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    // Logo
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Logo")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    // TableView
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        let heightRow = view.frame.height / 20
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.isScrollEnabled = false
        tableView.dataSource = self
        tableView.register(QuestionTableViewCell.self, forCellReuseIdentifier: QuestionTableViewCell.identifier)
        tableView.rowHeight = heightRow
        tableView.separatorStyle = .none
        tableView.backgroundColor = .none
        tableView.backgroundView = UIView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
}

// MARK: - SetupView
extension QuestionsListViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(backgroundImage)
        
        stackView.addArrangedSubview(logoImage)
        stackView.addArrangedSubview(tableView)
        view.addSubview(stackView)
    }
}

// MARK: - SetupConstraints
extension QuestionsListViewController {
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        let logoHeight = view.frame.height / 12
        let stackHeight = ((view.frame.height / 20) * 15) + 10 + logoHeight
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 40),
            safeArea.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 40),
//            safeArea.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            stackView.heightAnchor.constraint(equalToConstant: stackHeight)
        ])
        
        NSLayoutConstraint.activate([
            logoImage.heightAnchor.constraint(equalToConstant: logoHeight)
        ])
        
        NSLayoutConstraint.activate([
//            tableView.heightAnchor.constraint(equalToConstant: (view.frame.height / 21) * 15)
        ])
    }
}

// MARK: - TableView DataSource
extension QuestionsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier, for: indexPath) as! QuestionTableViewCell
        
        cell.backgroundColor = .none
        cell.backgroundView = UIView()
        cell.titleLabel.text = qlist[indexPath.row].title
        
        if qlist[indexPath.row].amount == 1000000 {
            cell.amountLabel.text = "1 Миллион"
            cell.bgImage.image = Images.yellow
        } else if qlist[indexPath.row].title == "Вопрос 10" || qlist[indexPath.row].title == "Вопрос 5" {
            cell.amountLabel.text = "\(qlist[indexPath.row].amount) RUB"
            cell.bgImage.image = Images.blue
        } else {
            cell.amountLabel.text = "\(qlist[indexPath.row].amount) RUB"
            cell.bgImage.image = Images.violet
        }
        
        if indexPath.row == currentQuestion {
            cell.bgImage.image = Images.green
        }
        
        return cell
    }
}


//MARK: - Sound extension

extension QuestionsListViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        SoundClass.playSound(resource: .answerIsCorrect)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        SoundClass.stopSound()
    }
}
