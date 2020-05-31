//
//  UserMainIPageViewController.swift
//  socialNet
//
//  Created by Кирилл Крамар on 29.05.2020.
//  Copyright © 2020 Кирилл Крамар. All rights reserved.
//

import UIKit

class UserMainIPageViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var userNameLabel: UILabel!
   
    // MARK: - Public Properties
    var userInforamation : User!
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
    }
    
    // MARK: - Private Methods
    private func setupLabels(){
        userNameLabel.text = ("Здравствуйте, \(userInforamation.firsName)")
    }
}
