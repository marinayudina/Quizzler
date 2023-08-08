//
//  ViewController.swift
//  Quizzler
//
//  Created by Марина on 01.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var quizBrain = QuizBrain()
    
    private let bubblImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Background-Bubbles")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        return label
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Question Text"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()
    
    private lazy var firstButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("First", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        button.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Second", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        button.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var thirdButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Third", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        button.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let progView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = .white
        progressView.progressTintColor = .systemPink
        progressView.progress = 0.5
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupView()
        setConstraints()
        updateUI()
    }
    
    private func setupView(){
  
        view.backgroundColor = #colorLiteral(red: 0.1923559308, green: 0.2327082157, blue: 0.3624993563, alpha: 1)

        view.addSubview(bubblImage)
        
        mainStack.addArrangedSubview(scoreLabel)
        mainStack.addArrangedSubview(questionLabel)
        mainStack.addArrangedSubview(firstButton)
        mainStack.addArrangedSubview(secondButton)
        mainStack.addArrangedSubview(thirdButton)
        mainStack.addArrangedSubview(progView)
        view.addSubview(mainStack)
    }
    @objc func answerButtonTapped(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        firstButton.setTitle(quizBrain.getButtonTitle(0), for: .normal)
        secondButton.setTitle(quizBrain.getButtonTitle(1), for: .normal)
        thirdButton.setTitle(quizBrain.getButtonTitle(2), for: .normal)
        
        progView.progress =  quizBrain.getProgress()
        scoreLabel.text = "Scrore: \(quizBrain.getScore())"
        
        firstButton.backgroundColor = .clear
        secondButton.backgroundColor = .clear
        thirdButton.backgroundColor = .clear

    }

}

extension ViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            progView.heightAnchor.constraint(equalToConstant: 5),
            
            firstButton.heightAnchor.constraint(equalToConstant: 80),
            secondButton.heightAnchor.constraint(equalToConstant: 80),
            thirdButton.heightAnchor.constraint(equalToConstant: 80),

            
            bubblImage.heightAnchor.constraint(equalToConstant: 102),
            bubblImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bubblImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bubblImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),

//            questionLabel.leadingAnchor.constraint(equalTo: mainStack.leadingAnchor, constant: 10)
        ])
    }
}
