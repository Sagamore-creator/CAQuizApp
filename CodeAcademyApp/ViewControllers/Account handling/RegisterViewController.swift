import UIKit

final class RegisterViewController: CodeAcademyViewController {

    @IBOutlet private weak var usernameTextField: CATextField!
    @IBOutlet private weak var passwordTextField: CATextField!
    @IBOutlet private weak var registerButton: CAButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        navigationItem.title = "Register"
        view.backgroundColor = Color(.gray)

        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = textAttributes

        registerButton.styleButton(
            title: "Register",
            titleColor: .gray,
            image: .register,
            background: .green,
            borderColor: .clear
        )
    }

    @IBAction func registerButtonPressed(_ sender: Any) {
        do {
            try AccountManager.registerAccount(username: usernameTextField.text, password: passwordTextField.text)
            proceedToQuizView()
        } catch {
            if let error = error as? AccountManager.AccountManagerError {
                showFailureAlert(message: error.errorDescription)
            }
        }
    }
}
