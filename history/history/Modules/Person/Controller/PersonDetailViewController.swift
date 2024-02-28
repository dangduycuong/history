//
//  PersonDetailViewController.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import WebKit
import UIKit

class PersonDetailViewController: BaseViewController {
    var webView: WKWebView!
    var personModel: PersonModel?
    
    override func loadView() {
        super.loadView()
        prepareForViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
        guard let string = personModel?.url else { return }
        guard let url = URL(string: string) else { return }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    private func prepareForViewController() {
        addBackground()
        addTitle(title: personModel?.name)
        addBackButton()
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.scrollView.showsVerticalScrollIndicator = false
        view.layout(webView)
            .below(titleLabel, 16)
            .left()
            .bottomSafe()
            .right()
    }
    
    func loadFile() {
//        guard let fileName = personModel?.name else { return }
//        if let rtfPath = Bundle.main.url(forResource: fileName, withExtension: "rtf") {
//            do {
//                let attributedStringWithRtf: NSAttributedString = try NSAttributedString(
//                    url: rtfPath, options: [
//                        NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.rtf
//                    ], documentAttributes: nil)
//                
//                textView.attributedText = attributedStringWithRtf
//            } catch let error {
//                print("Got an error \(error)")
//            }
//        }
    }
}

extension PersonDetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        Utils.showLoadingIndicator()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Utils.hideLoadingIndicator()
    }
}
