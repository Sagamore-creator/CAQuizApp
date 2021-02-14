import UIKit

final class UserSettingsViewController: CodeAcademyViewController {

    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var usernameTextField: CATextField!
    @IBOutlet private weak var passwordTextField: CATextField!
    @IBOutlet weak var deleteUsersButton: CAButton!
    @IBOutlet private weak var saveButton: CAButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        view.backgroundColor = Color(.gray)

        deleteUsersButton.styleButton(
            title: "Delete All Users",
            titleColor: .gray,
            image: .trash,
            background: .red,
            borderColor: .clear,
            isHidden: AccountManager.isNotAdmin()
        )
        
        saveButton.styleButton(
            title: "Save",
            titleColor: .gray,
            image: .save,
            background: .green,
            borderColor: .clear
        )
    }

    @IBAction func deleteUsersButtonTapped(_ sender: Any) {
        AccountManager.deleteUsers()
        dismiss(animated: true)
    }
    
    @IBAction private func saveButtonTapped() {
        dismiss(animated: true)
    }
}
