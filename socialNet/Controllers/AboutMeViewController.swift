//
//  AboutMeViewController.swift
//  socialNet
//
//  Created by Кирилл Крамар on 29.05.2020.
//  Copyright © 2020 Кирилл Крамар. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var aboutMeLabel: UILabel!
    
    // MARK: - Public Properties
    var userInforamation: User!
    
     // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
    }
    
    // MARK: - Private Methods
    private func setupLabels(){
        nameLabel.text = userInforamation.firsName
        ageLabel.text = ("\(userInforamation.age)")
        cityLabel.text = userInforamation.placeOfResidence.city
        countryLabel.text = userInforamation.placeOfResidence.country
        genderLabel.text  = userInforamation.gender.rawValue
        aboutMeLabel.text = userInforamation.additionalInformation
    }
}
