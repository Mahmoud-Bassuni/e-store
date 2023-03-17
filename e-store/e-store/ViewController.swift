//
//  ViewController.swift
//  e-store
//
//  Created by Bassuni on 09/03/2023.
//

import UIKit
import Alamofire
import Domain
class ViewController: UIViewController  {
    
    let user = FetchUserUseCase().fetchUserData()
    @IBAction func fire_btn_action(_ sender: Any) {
       // fatalError("error")
        print(user.email,user.id)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(user)
        // Do any additional setup after loading the view.
    }


}

