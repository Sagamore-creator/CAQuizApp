import UIKit

class CodeAcademyViewController: UIViewController {

    typealias VoidCompletion = () -> Void

    private let AlertButtonTitle = "OK"
    private let FailureAlertTitle = "Oops!"

    // MARK: - Alert functionality

    lazy var alert = {
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)?.first as? AlertView
    }()

    func showFailureAlert(message: String, animated: Bool = true) {
        guard let failureAlert = alert else {
            return
        }
        failureAlert.configureView(
            title: FailureAlertTitle,
            message: message,
            agreeButtonTitle: "OK"
        )
        view.addSubview(failureAlert)
    }

    // MARK: - Storyboards

    private lazy var QuizHomeStoryboard: UIStoryboard = {
        UIStoryboard(name: "QuizHome", bundle: nil)
    }()

    private lazy var SettingsStoryboard: UIStoryboard = {
        UIStoryboard(name: "Settings", bundle: nil)
    }()
}

extension CodeAcademyViewController {

    // MARK: - UIViewControllers & Transitions

    private var QuizHomeViewController: UIViewController {
        QuizHomeStoryboard.instantiateViewController(identifier: "QuizHomeViewController")
    }

    func proceedToQuizView() {
        modalPresentationStyle = .fullScreen
        present(QuizHomeViewController, animated: true)
    }

    private var QuestionViewController: UIViewController {
        QuizHomeStoryboard.instantiateViewController(identifier: "QuestionViewController")
    }

    func proceedToQuestionView() {
        modalPresentationStyle = .fullScreen
        present(QuestionViewController, animated: true)
    }

    private var AddQuestionViewController: UIViewController {
        QuizHomeStoryboard.instantiateViewController(identifier: "AddQuestionViewController")
    }

    func proceedToAddQuestionView() {
        modalPresentationStyle = .fullScreen
        present(AddQuestionViewController, animated: true)
    }

    private var LeaderboardTableViewController: UITableViewController {
        QuizHomeStoryboard.instantiateViewController(identifier: "LeaderboardViewController")
    }

    func proceedToLeaderboardView() {
        modalPresentationStyle = .fullScreen
        present(LeaderboardTableViewController, animated: true)
    }

    private var SettingsViewController: UIViewController {
        SettingsStoryboard.instantiateViewController(withIdentifier: "SettingsViewController")
    }

    func proceedToSettingsView() {
        modalPresentationStyle = .fullScreen
        present(SettingsViewController, animated: true)
    }

    private var UserSettingsViewController: UIViewController {
        SettingsStoryboard.instantiateViewController(withIdentifier: "UserSettingsViewController")
    }

    func proceedToUserSettings() {
        modalPresentationStyle = .fullScreen
        present(UserSettingsViewController, animated: true)
    }

    private var QuizSettingsViewController: UIViewController {
        SettingsStoryboard.instantiateViewController(withIdentifier: "QuizSettingsViewController")
    }

    func proceedToQuizzSettings() {
        modalPresentationStyle = .fullScreen
        present(QuizSettingsViewController, animated: true)
    }

    private var LeaderboardSettingsViewController: UIViewController {
        SettingsStoryboard.instantiateViewController(withIdentifier: "LeaderboardSettingsViewController")
    }

    func proceedToLeaderboardSettings() {
        modalPresentationStyle = .fullScreen
        present(LeaderboardSettingsViewController, animated: true)
    }
}

// MARK: - UITextFieldDelegate methods

extension CodeAcademyViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
