//
//  SelectFormationViewController.swift
//  Real Sports
//
//  Created by Remya on 2/2/23.
//

import UIKit
import SwiftEntryKit

class SelectFormationViewController: UIViewController {
    
    @IBOutlet var txtTitle: UILabel!
    @IBOutlet weak var tableView:UITableView!
    var formations = ["5-3-2","3-2-3-2","3-4-3","4-3-3","3-5-2","4-2-4","4-4-2","4-2-3-1","4-5-1","4-1-3-2"]
    var confirmButtonClicked: ((String) -> Void)?
    var cancelButtonClicked: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtTitle.text = "Select Your Formation".localized

        // Do any additional setup after loading the view.
    }
    
    static func instance()-> SelectFormationViewController
    {
        let storyboard = UIStoryboard.init(name: "Dialogs", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SelectFormationViewController") as! SelectFormationViewController
        return vc
    }
  

}


extension SelectFormationViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return formations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let lbl = cell?.viewWithTag(1) as? UILabel
        lbl?.text = formations[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        confirmButtonClicked?(formations[indexPath.row])
        SwiftEntryKit.dismiss()
    }
    
    
}
