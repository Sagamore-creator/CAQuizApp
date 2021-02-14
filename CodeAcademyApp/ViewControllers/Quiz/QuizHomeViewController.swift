import UIKit

class QuizHomeViewController: CodeAcademyViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var pointsForCorrectLabel: UILabel!
    @IBOutlet weak var pointsMinusWhenWrongLabel: UILabel!
    @IBOutlet weak var pointsPenaltyWhenMoreTimeLabel: UILabel!
    @IBOutlet weak var leaderboardButton: CAButton!
    @IBOutlet weak var beginButton: CAButton!
    @IBOutlet weak var settingsButton: CAButton!
    @IBOutlet weak var logoutButton: CAButton!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadPointsRulesLabels()
        configureView()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    // MARK: - Actions

    @IBAction func beginButtonPressed(_ sender: Any) {
        proceedToQuestionView()
    }

    @IBAction func settingsButtonPressed() {
        proceedToSettingsView()
    }

    @IBAction func logoutButtonPressed(_ sender: Any) {
        UserDefaultsManager.loggedInAccount = nil
        dismiss(animated: true)
    }

    @IBAction func leaderboardButtonPressed(_ sender: Any) {
        proceedToLeaderboardView()
    }

    // MARK: - Configure View

    private func configureView() {
        view.backgroundColor = Color(.gray)
        pointsForCorrectLabel.textColor = Color(.white)
        pointsMinusWhenWrongLabel.textColor = Color(.white)
        pointsPenaltyWhenMoreTimeLabel.textColor = Color(.white)

        leaderboardButton.styleButton(
            title: "Leaderboard",
            image: .leader,
            isHidden: isLeaderboardHidden()
        )

        beginButton.styleButton(
            title: "Begin",
            titleColor: .gray,
            image: .begin,
            background: .green,
            borderColor: .clear,
            isEnabled: isBeginButtonEnabled()
        )

        settingsButton.styleButton(
            title: "Settings",
            image: .settings
        )

        logoutButton.styleButton(
            title: "Logout",
            titleColor: .gray,
            image: .logout,
            background: .red,
            borderColor: .clear
        )

        if let loggedInUser = AccountManager.loggedInAccount?.username {
            welcomeLabel.text = "Welcome to the quiz, \(loggedInUser)"
        }
    }

    private func isLeaderboardHidden() -> Bool {
        guard let isGameSavesEmpty = UserDefaultsManager.gameSaves,
              isGameSavesEmpty.isEmpty
        else {
            return false
        }
        return true
    }

    private func isBeginButtonEnabled() -> Bool {
        guard let isQuestionsEmpty = UserDefaultsManager.questions,
              isQuestionsEmpty.isEmpty
        else {
            return true
        }
        return false
    }
    
    private func loadPointsRulesLabels() {
        pointsForCorrectLabel.text = "Points for correct answer: \(QuizManager.pointsRules.correctAnswer)"
        pointsMinusWhenWrongLabel.text = "Points minus when wrong answer: \(QuizManager.pointsRules.wrongAnswer)"
        pointsPenaltyWhenMoreTimeLabel.text = "Penalty points when more time asked: \(QuizManager.pointsRules.timePenalty)"
    }

    deinit {
        print("QuizHomeView dismissed")
    }
}
