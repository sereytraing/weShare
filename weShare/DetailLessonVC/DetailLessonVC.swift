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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var qcmButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var viewPdf: UIView!
    
    var content: Content?
    var webView: UIWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView?.backgroundColor = UIColor.clear
        self.webView?.isOpaque = true
        self.viewPdf.isOpaque = true
        self.viewPdf.backgroundColor = UIColor.clear
        if let url = URL(string: (content?.fileUrl)!) {
            let urlRequest = URLRequest(url: url)
            self.webView = UIWebView()
            self.webView?.delegate = self
            self.webView?.frame = self.viewPdf.bounds
            self.webView?.loadRequest(urlRequest)
        }
        self.title = self.content?.title
        
        self.navigationController?.navigationBar.backItem?.title = "Anything Else"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func deviceRotated() {
        self.webView?.frame = self.viewPdf.bounds
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.deviceRotated()
    }
    
    
    @IBAction func qcmButtonTouched(_ sender: Any) {
        let quizVC = QuizVC(nibName: QuizVC.className(), bundle: nil)
        navigationController?.pushViewController(quizVC, animated: true)
    }
    @IBAction func commentButtonTouched(_ sender: Any) {
        let commentVC = CommentVC(nibName: CommentVC.className(), bundle: nil)
        navigationController?.pushViewController(commentVC, animated: true)
    }
}

extension DetailLessonVC: UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.activityIndicator.stopAnimating()
        self.viewPdf.addSubview(self.webView!)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.activityIndicator.startAnimating()
    }
}
