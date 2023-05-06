//
//  WebViewViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 06/05/2023.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {

    @IBOutlet var weView: WKWebView!
    var fromStart = false
    var urlString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupSpecialButtons()
        loadUrl()
    }
    
    func setupSpecialButtons(){
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        btn.setImage(UIImage(named: "Back"), for: .normal)
        btn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
    }
    
    @objc func backAction(){
        AppPreferences.setIsSearched(value: false)
        if fromStart{
        Utility.gotoHome()
            if Utility.getSettingsDateDiff() >= 3{
                Utility.callURlDetailsAPI()
            }
        }
        else{
            self.navigationController?.popViewController(animated: true)
        }
    
    }
    

    func loadUrl(){
        if let link = URL(string:urlString){
        let request = URLRequest(url: link)
        weView.load(request)
        }
    }

}
