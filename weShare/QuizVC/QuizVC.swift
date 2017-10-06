//
//  QuizVC.swift
//  weShare
//
//  Created by TRAING Serey on 04/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import UIKit

class QuizVC: DefaultVC {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstAnswer: UIButton!
    @IBOutlet weak var secondAnswer: UIButton!
    @IBOutlet weak var thirdAnswer: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    var totalScore = 0
    var indexQuestion = 0
    var timer: Timer?
    let delay = 10.0
    var timerSec: Timer?
    let delaySec = 1.0
    var counterTimer = 0
    
    
    var questions = ["Q1 - Quand est sorti le Swift ?",
                     "Q2 - Est-ce que le ; est obligatoire à la fin d'une ligne en Swift ?",
                 "Q3 - A quoi sert généralement un TextField ?"]
    var comments = [["2014", "2015", "2016"],
                    ["Oui", "Non", "Ok"],
                    ["Pour saisir du texte", "Pour afficher du texte", "Pour choisir un élément d'une liste"]]
    var answers = [0,
                   1,
                   1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initQuestion()
        self.firstAnswer.layer.cornerRadius = 5.0
        self.secondAnswer.layer.cornerRadius = 5.0
        self.thirdAnswer.layer.cornerRadius = 5.0
        
        let alert = UIAlertController(title: "Attention", message: "Êtes-vous prêt ?", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Oui", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.createTimer()
            self.initQuestion()
        }
        let closeAction = UIAlertAction(title: "Non", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        alert.addAction(closeAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func createTimer() {
        self.counterTimer = 0
        self.timerLabel.text = "10 sec"
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(timeInterval: delay, target:self, selector: #selector(nextQuestion), userInfo: nil, repeats: true)
        self.timerSec?.invalidate()
        self.timerSec = Timer.scheduledTimer(timeInterval: delaySec, target:self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    func updateCounter() {
        self.counterTimer += 1
        self.timerLabel.text = "\(10 - counterTimer) sec"
    }
    
    func nextQuestion() {
        self.indexQuestion += 1
        if self.indexQuestion < 3 {
            self.initQuestion()
            self.createTimer()
        } else {
            self.timer?.invalidate()
            self.timerSec?.invalidate()
            self.timerLabel.text = "0"
            if self.totalScore > 1 {
                let alert = UIAlertController(title: "Félicitations !", message: "Le QCM est terminé \n Score final: \(self.totalScore) / 3 \n Vous avez gagné 1 point OPEN !", preferredStyle: UIAlertControllerStyle.alert)
                let closeAction = UIAlertAction(title: "Fermer", style: UIAlertActionStyle.default) {
                    UIAlertAction in
                    self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(closeAction)
                self.present(alert, animated: true, completion: nil)
            }
            let alert = UIAlertController(title: "Félicitations !", message: "Le QCM est terminé \n Score final: \(self.totalScore) / 3 ", preferredStyle: UIAlertControllerStyle.alert)
            let closeAction = UIAlertAction(title: "Fermer", style: UIAlertActionStyle.default) {
                UIAlertAction in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func initQuestion() {
        self.questionLabel.text = self.questions[self.indexQuestion]
        self.firstAnswer.setTitle(self.comments[self.indexQuestion][0], for: .normal)
        self.secondAnswer.setTitle(self.comments[self.indexQuestion][1], for: .normal)
        self.thirdAnswer.setTitle(self.comments[self.indexQuestion][2], for: .normal)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.timer?.invalidate()
        self.timerSec?.invalidate()
    }

    @IBAction func firstClicked(_ sender: Any) {
        switch self.indexQuestion {
        case 0:
            self.totalScore += 1
            self.nextQuestion()
            
        default:
            self.nextQuestion()
        }
    }
    
    @IBAction func secondClicked(_ sender: Any) {
        switch self.indexQuestion {
        case 1, 2:
            self.totalScore += 1
            self.nextQuestion()
        default:
            self.nextQuestion()
        }
    }
    
    @IBAction func thirdClicked(_ sender: Any) {
        switch self.indexQuestion {
        default:
            self.nextQuestion()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
