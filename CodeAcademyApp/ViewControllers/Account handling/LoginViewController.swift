import UIKit

final class LoginViewController: CodeAcademyViewController {

    @IBOutlet private weak var usernameTextField: CATextField!
    @IBOutlet private weak var passwordTextField: CATextField!
    @IBOutlet private weak var loginButton: CAButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.CATextFieldDelegate = self
        passwordTextField.CATextFieldDelegate = self
        configureView()
    }

    private func configureView() {
        view.backgroundColor = Color(.gray)
        navigationItem.title = "Login"
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = textAttributes

        loginButton.styleButton(
            title: "Login",
            image: .login
        )
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        do {
            try AccountManager.login(username: usernameTextField.text, password: passwordTextField.text)
            proceedToQuizView()
        } catch {
            if let error = error as? AccountManager.AccountManagerError {
                showFailureAlert(message: error.errorDescription)
            }
        }
    }
}

// MARK: - ClearableTextFieldDelegate methods

extension LoginViewController: CATextFieldDelegate {
    func didTapClearIcon(_ icon: UIImageView) {
        print("I was tapped!")
    }
}
