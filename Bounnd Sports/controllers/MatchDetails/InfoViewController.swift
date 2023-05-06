//
//  InfoViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 03/05/2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet var emptyView: UIView!
    @IBOutlet var stadiumLable: UILabel!
    @IBOutlet var countryLable: UILabel!
    @IBOutlet var cityLable: UILabel!
    @IBOutlet var dateLable: UILabel!
    @IBOutlet var txtAbout: UITextView!
    
    
    var data: DataMatchDetail?{
        didSet{
            SetData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func SetData(){
        emptyView.isHidden = true
        txtAbout.text = data?.about
        dateLable.text = Utility.returnIndicatorForFollowing(key: "Capacity", list: data?.location ?? [])?.value
        countryLable.text = Utility.returnIndicatorForFollowing(key: "Country", list: data?.location ?? [])?.value
        cityLable.text = Utility.returnIndicatorForFollowing(key: "City", list: data?.location ?? [])?.value
        stadiumLable.text = Utility.returnIndicatorForFollowing(key: "Stadium", list: data?.location ?? [])?.value
    }
    


}
