//
//  DetailLessonVC.swift
//  weShare
//
//  Created by TRAING Serey on 04/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import WebKit
import UIKit

class DetailLessonVC: DefaultVC {
    
    @IBOutlet weak var nameLesson: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var qcmButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var viewPdf: UIView!
    
    var urlPdf: String?
    var webView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: urlPdf!) {
            let urlRequest = URLRequest(url: url)
            self.webView = WKWebView()
            self.webView?.frame = self.viewPdf.bounds
            self.webView?.load(urlRequest)
            self.viewPdf.addSubview(webView!)
        }
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
