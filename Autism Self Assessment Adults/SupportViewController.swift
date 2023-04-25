//
//  SupportViewController.swift
//  Autism Self Assessment Adults
//
//  Created by Jon Salkin on 4/23/23.
//

import UIKit
import WebKit

class SupportViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.google.com/search?q=adult+autism+support")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
    }
    
    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page…", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "www.hhs.gov/programs/topic-sites/autism/autism-support/index.html", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "centerforautism.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "www.aane.org/resources/adults/", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "www.verywellhealth.com/services-for-adults-with-autism-4771552m", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "adultautismcenter.org", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "autisticadvocacy.org/resources/", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }

    func openPage(action: UIAlertAction) {
        guard let actionTitle = action.title else { return }
        guard let url = URL(string: "https://" + actionTitle) else { return }
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        title = webView.title
    }
    
}
