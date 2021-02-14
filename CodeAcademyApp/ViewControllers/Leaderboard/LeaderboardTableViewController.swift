import UIKit

final class LeaderboardTableViewController: UITableViewController {

    private var scores = [ScoreRow]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scores = LeaderboardManager.scoreRows
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderboardCell", for: indexPath)
        let scoreRow = scores[indexPath.row]
        cell.textLabel?.text = scoreRow.username
        cell.detailTextLabel?.text = String(scoreRow.points)

        return cell
    }
}
