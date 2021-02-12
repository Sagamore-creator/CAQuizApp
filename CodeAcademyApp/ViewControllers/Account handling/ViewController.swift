import UIKit

final class ViewController: CodeAcademyViewController {

    @IBOutlet private weak var loginButton: CAButton!
    @IBOutlet private weak var registerButton: CAButton!
    @IBOutlet private weak var logoImageView: UIImageView!

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configureView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        logoImageView.image = UIImage(named: "QuizzIcon")?.withTintColor(Color(.green) ?? .white)

        view.backgroundColor = Color(.gray)

        loginButton.styleButton(title: "Login")

        registerButton.styleButton(
            title: "Register",
            titleColor: .gray,
            background: .green,
            borderColor: .clear
        )
    }

    private static func isLoggedIn() {
        if UserDefaultsManager.loggedInAccount != nil {
            AccountManager.loggedInAccount = UserDefaultsManager.loggedInAccount
//            proceedToQuizView()
        }
    }
}
