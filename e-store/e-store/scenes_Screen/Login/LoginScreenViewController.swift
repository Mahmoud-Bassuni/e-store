//
//  LoginScreenViewController.swift
//  e-store
//
//  Created by Bassuni on 16/03/2023.
//

import UIKit
import Domain

class LoginScreenViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    // MARK: Proprites
    var loginViewModel : LoginViewModel
    var arrayOfUsersName : [User] = []
    // MARK: Init

    init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        bindTextFields()
        updatedataUser()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ShowUserData", bundle: nil), forCellReuseIdentifier: "ShowUserData")

    }
    @IBAction func getUserData(_ sender: UIButton) {
        updatedataUser()
        loginViewModel.getAllUsers { users in
            self.arrayOfUsersName = users
            self.tableView.reloadData()
        }
    }
}

// MARK: Bind view model
extension LoginScreenViewController {

    private func bindViewModel() {
        loginViewModel.checkConfigButton { [weak self] enable in
            self?.submitBtn.isEnabled = enable
        }
    }

    private func bindTextFields() {
        emailTxt.addTarget(self, action: #selector(updateEmailTextField), for: .editingChanged)
        passwordTxt.addTarget(self, action: #selector(updatePasswordTextField), for: .editingChanged)

    }
    private func updatedataUser() {
        loginViewModel.getSingleUser {user in
            self.idLbl.text = "\(user.id)"
            self.emailLbl.text = user.email
        }
    }
}

// MARK: Actions
extension LoginScreenViewController {
    @objc
    func updateEmailTextField(textField: UITextField) {
        loginViewModel.updateEmail(email: textField.text ?? "")
    }

    @objc
    func updatePasswordTextField(textField: UITextField) {
        loginViewModel.updatePassword(password: textField.text ?? "")
    }
}

// MARK: TableView Delegate and DataSource
extension LoginScreenViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfUsersName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowUserData", for: indexPath) as! ShowUserData
        cell.idLbl.text = "\(arrayOfUsersName[indexPath.row].id)"
        cell.emailLbl.text = arrayOfUsersName[indexPath.row].email
        cell.passLbl.text = arrayOfUsersName[indexPath.row].password
        cell.phoneLbl.text = arrayOfUsersName[indexPath.row].phone
        cell.userNameLbl.text = arrayOfUsersName[indexPath.row].username
        return cell
    }
}
