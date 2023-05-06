//
//  LaunchViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 01/05/2023.
//

import UIKit
import MOLH

class LaunchViewController: UIViewController {

    @IBOutlet var appTitleLable: UILabel!
    var timer = Timer()
    var urlData : UrlDetails?

    override func viewDidLoad() {
        super.viewDidLoad()
        if Utility.getSettingsDateDiff() >= 3{
        callSettingsAPI()
        configureTimer()
        }
        else{
            self.initialLoad()
        }
        
       
    }
    
    func configureTimer(){
       
       timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
    }
    

    
    @objc func timerAction(){
            self.initialLoad()
            timer.invalidate()
    }
    
    func callSettingsAPI(){
        HomeAPI().getUrlInfo { response in
            HomeViewController.urlDetails = response
            print("I Got Response \(response)" )
        } failed: { _ in
            // failed
        }
    }


    
    func initialLoad(){
    
        if AppPreferences.getIsSearched(){
                self.openWebViewWithBack()
        
        }
        else{
            let delegate = UIApplication.shared.delegate as? AppDelegate
            if delegate?.getPhoneLanguage() == "zh"{
                MOLHLanguage.setAppleLAnguageTo("zh-Hans")
                MOLH.reset()
            }
            else{
                delegate?.setupLaunch()
            }
            
        }
    }
    
    func openWebViewWithBack(){
            let navigation = UINavigationController()
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebViewViewController") as! WebViewViewController
            vc.urlString = AppPreferences.getMapObject()?.redirectUrl ?? ""
            vc.fromStart = true
            navigation.viewControllers = [vc]
            (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = navigation
            
        }

}
