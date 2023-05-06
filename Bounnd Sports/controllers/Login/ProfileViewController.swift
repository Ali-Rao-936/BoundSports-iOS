//
//  ProfileViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 27/04/2023.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var txtEmail: PaddingTextField!
    @IBOutlet var etName: UITextField!
    @IBOutlet var imgUser: UIImageView!
    
    var profileImage:UIImage?
    var viewmodel = EditProfileViewmodel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackButton()
        setupNavBar(name: "Edit Profile")
        
        txtEmail.text = AppPreferences.getUserData()?.username
        etName.text = AppPreferences.getUserData()?.name
        let url = BaseUrl.getBaseUrl(apiType: .OTHER) + (AppPreferences.getUserData()?.profilepic ?? "")
        imgUser.setImage(with: url, placeholder: UIImage(named: "Avatar"))

        
        imgUser.setOnClickListener {
            ImagePickerManager().pickImage(self){ image in
                self.imgUser.image=image
                self.profileImage=image
            }
        }
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        self.openVC(storyBoard: "LoginStoryboard", identifier: "UpdatePasswordViewController")
    }
    
    @IBAction func btnUpdate(_ sender: Any) {
        // update name and image
        self.viewmodel.updateProfile(image: self.profileImage,name: self.etName.text?.string ?? "")
    }


}
