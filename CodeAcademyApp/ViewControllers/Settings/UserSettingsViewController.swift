import UIKit

final class UserSettingsViewController: CodeAcademyViewController {

    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var usernameTextField: CATextField!
    @IBOutlet private weak var passwordTextField: CATextField!
    @IBOutlet private weak var saveButton: CAButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        view.backgroundColor = Color(.gray)
        
        saveButton.styleButton(
            title: "Save",
            titleColor: .gray,
            image: .save,
            background: .green,
            borderColor: .clear
        )
    }

    @IBAction private func saveButtonTapped() {
        dismiss(animated: true)
    }
}
