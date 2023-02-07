//
//  RulesViewController.swift
//  MillionaireApp
//
//  Created by Николай Игнатов on 07.02.2023.
//

import UIKit

final class RulesViewController: UIViewController {
    
    private let backgroundView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "background")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let firstParagraph: UILabel = {
        let label = UILabel()
        label.text = RulesModel.firstParagraph
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let questionNominal: UILabel = {
        let label = UILabel()
        label.text = RulesModel.questionNominal
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.numberOfLines = 0
        label.textColor = .systemYellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondParagraph: UILabel = {
        let label = UILabel()
        label.text = RulesModel.secondParagraph
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let hintsTitle: UILabel = {
        let label = UILabel()
        label.text = RulesModel.hintsTitle
        label.font = UIFont(name: "Helvetica-Bold", size: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let hints: UILabel = {
        let label = UILabel()
        label.text = RulesModel.hints
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(backgroundView)
        view.addSubview(scrollView)
        scrollView.addSubview(firstParagraph)
        scrollView.addSubview(questionNominal)
        scrollView.addSubview(secondParagraph)
        scrollView.addSubview(hintsTitle)
        scrollView.addSubview(hints)
    }
    
    private func setupNavigationBar() {
        title = RulesModel.title
        navigationController?.navigationBar.topItem?.title = "Назад"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

private extension RulesViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            firstParagraph.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            firstParagraph.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            firstParagraph.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            questionNominal.topAnchor.constraint(equalTo: firstParagraph.bottomAnchor, constant: 16),
            questionNominal.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            secondParagraph.topAnchor.constraint(equalTo: questionNominal.bottomAnchor, constant: 16),
            secondParagraph.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            secondParagraph.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            hintsTitle.topAnchor.constraint(equalTo: secondParagraph.bottomAnchor, constant: 16),
            hintsTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hints.topAnchor.constraint(equalTo: hintsTitle.bottomAnchor, constant: 16),
            hints.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            hints.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            hints.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
        ])
    }
}
