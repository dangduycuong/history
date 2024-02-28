//
//  TerritoryViewController.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import UIKit
import WebKit

class TerritoryViewController: BaseViewController {
    
    var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        prepareForViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://vi.wikipedia.org/wiki/An_D%C6%B0%C6%A1ng_V%C6%B0%C6%A1ng") else { return }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    private func prepareForViewController() {
        addBackground()
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.scrollView.showsVerticalScrollIndicator = false
        view.layout(webView)
            .topSafe()
            .left()
            .bottomSafe()
            .right()
    }

}

extension TerritoryViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        Utils.showLoadingIndicator()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Utils.hideLoadingIndicator()
    }
}

import Foundation

extension Data {
    
    func printResponseJson() {
        if let json = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers),
           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
            print(String(decoding: jsonData, as: UTF8.self))
        } else {
            print("json data malformed")
        }
    }
    
    func printFormatedJSON() {
        if let json = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers),
           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
            pringJSONData(jsonData)
        } else {
            assertionFailure("Malformed JSON")
        }
    }
    
    private func pringJSONData(_ data: Data) {
        print(String(decoding: data, as: UTF8.self))
    }
}
