import Foundation

final class LeaderboardSettingsViewController: CodeAcademyViewController {

    @IBOutlet weak var deleteLeaderboardScoresButton: CAButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        view.backgroundColor = Color(.gray)
        
        deleteLeaderboardScoresButton.styleButton(
            title: "Delete Leaderboard Scores",
            titleColor: .gray,
            image: .trash,
            background: .red,
            borderColor: .clear
        )
    }

    @IBAction func deleteLeaderboardScoresButtonTapped(_ sender: Any) {
        LeaderboardManager.deleteScore()
        dismiss(animated: true)
    }
}
