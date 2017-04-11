//
//  ViewController.swift
//  LetsChat
//
//  Created by mahmoud khudairi on 4/11/17.
//  Copyright © 2017 mahmoud khudairi. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "LogOut", style: .plain, target: self, action: #selector(handleLogout))
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
            handleLogout()
        }
    }
    func handleLogout(){
        do {
       try FIRAuth.auth()?.signOut()
        }catch let logoutError {
            print(logoutError)
        }
        let loginController = LoginViewController()
        present(loginController,animated: true, completion: nil)
        
    }
    


}

