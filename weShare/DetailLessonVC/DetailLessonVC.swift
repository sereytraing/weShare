//
//  DetailLessonVC.swift
//  weShare
//
//  Created by TRAING Serey on 04/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import UIKit

class DetailLessonVC: DefaultVC {
    
    @IBOutlet weak var nameLesson: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var qcmButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func qcmButtonTouched(_ sender: Any) {
        let quizVC = QuizVC(nibName: QuizVC.className(), bundle: nil)
        navigationController?.pushViewController(quizVC, animated: true)
    }
    @IBAction func commentButtonTouched(_ sender: Any) {
    }
}
