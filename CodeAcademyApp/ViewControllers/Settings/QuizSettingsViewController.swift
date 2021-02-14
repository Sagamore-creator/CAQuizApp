import UIKit

final class QuizSettingsViewController: CodeAcademyViewController {

    private let MinimumQuestions: Double = 1
    
    @IBOutlet weak var minQuestionsLabel: UILabel!
    @IBOutlet weak var maxQuestionsLabel: UILabel!
    @IBOutlet weak var timerSettingsLabel: UILabel!
    @IBOutlet weak var minQuestionsStepper: UIStepper!
    @IBOutlet weak var maxQuestionsStepper: UIStepper!
    @IBOutlet weak var timerSlider: UISlider!
    @IBOutlet weak var correctAnswerPointsTextField: CATextField!
    @IBOutlet weak var wrongAnswerPointsTextField: CATextField!
    @IBOutlet weak var penaltyPointsTextField: CATextField!
    @IBOutlet weak var addQuestionsButton: CAButton!
    @IBOutlet weak var saveButton: CAButton!
    @IBOutlet weak var deleteAllQuestionsButton: CAButton!

    private var minQuestions = Double()
    private var maxQuestions = Double()
    private var timeInterval = Float()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

// MARK: - Actions

    @IBAction func minQuestionsStepperValueChanged(_ sender: UIStepper) {
        minQuestionsLabel.text = "Min q: \(sender.value)"
    }
    
    @IBAction func maxQuestionsStepperValueChanged(_ sender: UIStepper) {
        maxQuestionsLabel.text = "Max q: \(sender.value)"
    }
    
    @IBAction func timmerSettingSliderValueChanged(_ sender: UISlider) {
        timerSettingsLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func deleteAllQuestionsButtonTapped(_ sender: Any) {
        QuizManager.deleteQuestions()
        dismiss(animated: true)
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}

// MARK: - Configure View

extension QuizSettingsViewController {

    private func configureView() {
        view.backgroundColor = Color(.gray)

        addQuestionsButton.styleButton(
            title: "Add Questions",
            isHidden: AccountManager.isNotAdmin()
        )

        deleteAllQuestionsButton.styleButton(
            title: "Delete All Questions",
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

        minQuestionsStepper.minimumValue = 1
        minQuestionsStepper.maximumValue = 10
        minQuestionsStepper.stepValue = 1
        maxQuestionsStepper.minimumValue = 1
        maxQuestionsStepper.maximumValue = 10
        maxQuestionsStepper.stepValue = 1
        timerSlider.minimumValue = 5
        timerSlider.maximumValue = 60
        timerSlider.value = timerSlider.minimumValue
    }
}
