import UIKit

class AddQuestionViewController: CodeAcademyViewController {

    @IBOutlet weak var questionDescriptionTextField: CATextField!
    @IBOutlet weak var firstAnswerTextField: CATextField!
    @IBOutlet weak var secondAnswerTextField: CATextField!
    @IBOutlet weak var thirdAnswerTextField: CATextField!
    @IBOutlet weak var correctAnswerTextField: CATextField!
    @IBOutlet weak var saveButton: CAButton!

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
            borderColor: .clear,
            isEnabled: false
        )
        isNotEmptyTextFields()
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
        addQuestionToDatabase()
        dismiss(animated: true)
    }
}

private extension AddQuestionViewController {
    
    var isAnswerValid: Bool {
        return
            correctAnswerTextField.text == firstAnswerTextField.text ||
            correctAnswerTextField.text == secondAnswerTextField.text ||
            correctAnswerTextField.text == thirdAnswerTextField.text
    }

    func addQuestionToDatabase() {
        guard let question = makeQuestion() else {
            return
        }
        UserDefaultsManager.saveQuestion(question)
    }
    
    func makeQuestion() -> Question? {
        guard isAnswerValid,
              let questionDescription = questionDescriptionTextField.text,
              let firstAnswer = firstAnswerTextField.text,
              let secondAnswer = secondAnswerTextField.text,
              let thirdAnswer = thirdAnswerTextField.text,
              let correctAnswer = correctAnswerTextField.text,
              !questionDescription.isEmpty,
              !firstAnswer.isEmpty,
              !secondAnswer.isEmpty,
              !thirdAnswer.isEmpty,
              !correctAnswer.isEmpty
        else {
            return nil
        }
        return Question(
            questionDescription: questionDescription,
            firstAnswer: firstAnswer,
            secondAnswer: secondAnswer,
            thirdAnswer: thirdAnswer,
            correctAnswer: correctAnswer
        )
    }

    func isNotEmptyTextFields() {
        questionDescriptionTextField.addTarget(self, action: #selector(buttonIsEnabled), for: .editingChanged)
        firstAnswerTextField.addTarget(self, action: #selector(buttonIsEnabled), for: .editingChanged)
        secondAnswerTextField.addTarget(self, action: #selector(buttonIsEnabled), for: .editingChanged)
        thirdAnswerTextField.addTarget(self, action: #selector(buttonIsEnabled), for: .editingChanged)
        correctAnswerTextField.addTarget(self, action: #selector(buttonIsEnabled), for: .editingChanged)
    }

    @objc func buttonIsEnabled() {
        guard
            let questionDescription = questionDescriptionTextField.text, !questionDescription.isEmpty,
            let firstAnswer = firstAnswerTextField.text, !firstAnswer.isEmpty,
            let secondAnswer = secondAnswerTextField.text, !secondAnswer.isEmpty,
            let thirdAnswer = thirdAnswerTextField.text, !thirdAnswer.isEmpty,
            let correctAnswer = correctAnswerTextField.text, !correctAnswer.isEmpty
        else {
            return
        }
        saveButton.isEnabled = true
    }
}
