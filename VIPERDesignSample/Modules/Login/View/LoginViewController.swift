//
//  LoginViewController.swift
//  VIPERDesignSample
//
//  Created by Nirupama M Abraham on 09/02/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    var presenter: LoginViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let userName = userNameTextField.text else {
            self.showAlert(withMessage: "Please enter the user name")
            return
        }
        guard let password = passwordTextField.text  else {
            self.showAlert(withMessage: "Please enter the password")
            return
        }
        presenter?.login(withUserName: userName, andPassword: password)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginViewController: LoginPresenterToViewProtocol {
    func loginFailed(withError error: NSError) {
        self.showAlert(withMessage: error.localizedDescription)
    }
}
