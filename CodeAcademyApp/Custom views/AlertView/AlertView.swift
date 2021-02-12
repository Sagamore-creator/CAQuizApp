import UIKit

typealias AlertDismissCompletion = (AlertView, UIButton) -> Void

@objc protocol AlertViewDelegate: class {
    @objc optional func didTapAgreeButton(alertView: AlertView, button: UIButton)
    @objc optional func didTapCancelButton(alertView: AlertView, button: UIButton)
}

final class AlertView: UIView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet weak var cancelButton: CAButton!
    @IBOutlet weak var agreeButton: CAButton!
    @IBOutlet weak var alertView: UIView!

    private weak var delegate: AlertViewDelegate?
    private var dismissCompletion: AlertDismissCompletion?

    func configureView(
        title: String,
        message: String,
        cancelButtonTitle: String? = nil,
        agreeButtonTitle: String,
        delegate: AlertViewDelegate? = nil,
        completion: AlertDismissCompletion? = nil
    ) {
        alertView.backgroundColor = Color(.white)
        alertView.layer.borderWidth = 1
        alertView.layer.borderColor = Color(.darkYellow)?.cgColor
        alertView.layer.cornerRadius = cornerRadius
        titleLabel.text = title
        messageLabel.text = message
        self.delegate = delegate
        dismissCompletion = completion

        agreeButton.styleButton(
            title: agreeButtonTitle,
            titleColor: .gray,
            background: .green,
            borderColor: .clear
        )

        guard let cancelButtonTitle = cancelButtonTitle else {
            cancelButton.isHidden = true
            return
        }
        cancelButton.styleButton(
            title: cancelButtonTitle,
            background: .red,
            borderColor: .clear
        )
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        delegate?.didTapCancelButton?(alertView: self, button: sender)
        dismissCompletion?(self, sender)
        removeFromSuperview()
    }
    
    @IBAction func agreeButtonTapped(_ sender: UIButton) {
        delegate?.didTapAgreeButton?(alertView: self, button: sender)
        dismissCompletion?(self, sender)
        removeFromSuperview()
    }
}
