//
//  ViewController.swift
//  socialNet
//
//  Created by Кирилл Крамар on 29.05.2020.
//  Copyright © 2020 Кирилл Крамар. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
    }
    
    // MARK: - Ovverride Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else {return}
        guard let userMainPageVC = tabBarController.viewControllers?.first as? UserMainIPageViewController else {return}
        //костыль
        userMainPageVC.userInforamation = User.getUser()
        guard let aboutMeVC = tabBarController.viewControllers?[1] as? AboutMeViewController else {return}
        aboutMeVC.userInforamation = User.getUser()
    }

    // MARK: - IB Actions
    @IBAction func logIn() {
        checkUser(enteredUserName: userNameTextField.text, enteredPassword: passwordTextField.text)
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func checkUserName() {
        let user = User.getUser()
        let userName = user.userName
        showAlert(with: "Your Username", and: userName)
    }
    
    @IBAction func checkPassword() {
        let user = User.getUser()
        let userPassword = user.password
        showAlert(with: "Your Password", and: userPassword)
        
    }
    
    // MARK: - Private Methods
    private func setupTextFields(){
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func showAlert(with title: String, and message: String){
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert,animated: true)
    }
    
    private func checkUser(enteredUserName: String?,enteredPassword: String?){
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        let user = User.getUser()
        let userName = user.userName
        let userPassword = user.password
        if let enteredUserName = enteredUserName , let enteredPassword = enteredPassword {
            if  enteredUserName == userName && enteredPassword == userPassword {
                performSegue(withIdentifier: "profileUser", sender: nil)
                return
            }
        }
        showAlert(with: "Ошибка", and: "Неверный логин или пароль")
        userNameTextField.text   = nil
        passwordTextField?.text = nil
    }
}

// MARK: - Text Field Delegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            passwordTextField.becomeFirstResponder()
        case 1:
            checkUser(enteredUserName: userNameTextField.text,enteredPassword: passwordTextField?.text)
        default:
            break
        }
        return true
    }
}

