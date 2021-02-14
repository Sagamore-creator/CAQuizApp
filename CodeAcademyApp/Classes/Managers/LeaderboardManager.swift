import Foundation

struct LeaderboardManager {

    static var scoreRows: [ScoreRow] {
        guard let gameSaves = UserDefaultsManager.gameSaves else {
            return []
        }
        var scoreRows = [ScoreRow]()
        let userNames = Set<String>(gameSaves.compactMap { $0.username })

        for user in userNames {
            let userScore = gameSaves.filter { $0.username == user }.map { $0.points }.max()
            scoreRows.append(ScoreRow(username: user, points: userScore ?? 0))
        }
        return scoreRows.sorted { $0.points > $1.points }
    }

    static func deleteScore() {
        UserDefaultsManager.deleteGameSaves()
    }
}
