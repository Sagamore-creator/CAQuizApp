import UIKit

final class SettingsViewController: CodeAcademyViewController {

    @IBOutlet private weak var userSettingsButton: CAButton!
    @IBOutlet private weak var quizSettingsButton: CAButton!
    @IBOutlet weak var leaderboardSettingsButton: CAButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        view.backgroundColor = Color(.gray)
        userSettingsButton.styleButton(title: "User Settings")
        quizSettingsButton.styleButton(title: "Quiz Settings")

        leaderboardSettingsButton.styleButton(
            title: "Leaderboard Settings",
            isHidden: AccountManager.isNotAdmin()
        )
    }

    // MARK: - Action

    @IBAction private func userSettingsButtonTapped(_ sender: Any) {
        proceedToUserSettings()
    }

    @IBAction private func quizzSettingsButtonTapped(_ sender: Any) {
        proceedToQuizzSettings()
    }

    @IBAction func leaderboardSettingsButtonTapped(_ sender: Any) {
        proceedToLeaderboardSettings()
    }
}
