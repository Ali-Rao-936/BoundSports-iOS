//
//  SettingsViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 26/04/2023.
//

import UIKit
import MessageUI

class SettingsViewController: UIViewController {
    
    var email = ""
    var menus = ["Languages".localized,"Privacy Policy".localized,"Feedback".localized,"Rate Us".localized, "Logout".localized, "Delete Account".localized]

    
  //  var  menus = ["Languages".localized,"Privacy Policy".localized,"Feedback".localized,"Rate Us".localized]


    @IBOutlet var editView: UIView!
    @IBOutlet var emailLable: UILabel!
    @IBOutlet var nameLable: UILabel!
    @IBOutlet var imgUser: UIImageView!
    @IBOutlet var tableView: UITableView!
    
    var viewmodel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fillData()
        viewmodel.delegateD = self
        setupNavBar(name: "Account")
        
        if self.email == ""{
        //    listViewHeight.constant = 192
             menus = ["Language".localized,"Privacy Policy".localized,"Feedback".localized,"Rate Us".localized]
        }
//        else{
//            listViewHeight.constant = 288
//        }
        
        tableView.register(UINib(nibName: "SettingsItemTableVC", bundle: nil), forCellReuseIdentifier: "SettingsItemTableVC")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        editView.setOnClickListener {
            if self.email == ""{
                self.openVC(storyBoard: "LoginStoryboard", identifier: "ChhoseViewController")
            }else{
                self.openVC(storyBoard: "LoginStoryboard", identifier: "ProfileViewController")
            }
        }
    }
    

    func fillData(){
        let user = AppPreferences.getUserData()
        let url = BaseUrl.getBaseUrl(apiType: .OTHER) + (user?.profilepic ?? "")
        imgUser.setImage(with: url, placeholder: UIImage(named: "UserAvatar"))
        nameLable.text = user?.name ?? "Guest User".localized
        emailLable.text = user?.username
        email = user?.username ?? ""
    }

    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["nevzatcolakk@gmail.com"])
            //mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)

            present(mail, animated: true)
        } else {
            Utility.showErrorSnackView(message: "Mail is not configured on the device")
            // show failure alert
        }
    }
    
}

extension SettingsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsItemTableVC") as! SettingsItemTableVC
        cell.titleLable.text = menus[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0:
            print("")
           // openVC(storyBoard: "SakherStoryboard", identifier: "LanguagesViewController")
        case 1:
            
            Utility.openUrl(url: URL(string: "https://hotballsports7.wordpress.com/6-2/")!)
          
        case 2:
            sendEmail()
//            Utility.shareAction(text: "Install HotBall Sports-Scoring & Info from apple appstore", url: URL(string: "") as NSURL?, image: UIImage(named: "launch"), vc: self.parent!)
            
        case 3:
        
            Utility.rateApp(id: "6447062830")
            
        case 4:
            Dialog.openConfirmationDialog(title: "Logout".localized, message: "Are you sure you want to logout?".localized) {
                AppPreferences.clearUserData()
                Utility.gotoHome()
                
            } dismissed: {
                
            }
           
            
        case 5:
            Dialog.openConfirmationDialog(title: "Delete Account".localized, message: "Are you sure you want to delete account?".localized) {
                self.viewmodel.callDeleteAccount()
                
            } dismissed: {
                
            }
            
        default:
            break
            
        }
    }
    
    
}


extension SettingsViewController:MFMailComposeViewControllerDelegate{
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
}


extension SettingsViewController:SettingsViewModelDelegate{
    func didFinishDeleteAccount() {
        AppPreferences.clearUserData()
        fillData()
    }
    
    
}
