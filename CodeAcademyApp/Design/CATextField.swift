import UIKit

typealias VoidCompletion = () -> Void

protocol CATextFieldDelegate: AnyObject {
    func didTapClearIcon(_ icon: UIImageView)
}

final class CATextField: UITextField {

    private let TextInset: CGFloat = 10
    private let IconFrame = CGRect(
        x: .zero,
        y: .zero,
        width: 20,
        height: 10
    )

    weak var CATextFieldDelegate: CATextFieldDelegate?
    var onDidTap: VoidCompletion?

    private lazy var clearIconView: UIImageView = {
        let clearIcon =  UIImage(named: "ClearIcon")?.withTintColor(.lightGray)
        let imageView = UIImageView(image: clearIcon)

        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(clearIconWasTapped)
        )
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)

        return imageView
    }()

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        configureView()
    }
}

// MARK: - Helpers

extension CATextField {

    private func configureView() {
        rightView = clearIconView
        rightViewMode = .whileEditing
        backgroundColor = .white
        autocorrectionType = .no
        layer.cornerRadius = cornerRadius

        addTarget(self, action: #selector(textFieldDidBeginEditing), for: .editingDidBegin)
        addTarget(self, action: #selector(textFieldDidChangeSelection), for: .editingChanged)
    }

    @objc private func clearIconWasTapped() {
        text = nil
        CATextFieldDelegate?.didTapClearIcon(clearIconView)
        onDidTap?()
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let insets = UIEdgeInsets(
            top: .zero,
            left: TextInset,
            bottom: .zero,
            right: .zero
        )
        return bounds.inset(by: insets)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let insets = UIEdgeInsets(
            top: .zero,
            left: TextInset,
            bottom: .zero,
            right: .zero
        )
        return bounds.inset(by: insets)
    }
}

// MARK: - UITextFieldDelegate methods

extension CATextField: UITextFieldDelegate {

    @objc func textFieldDidBeginEditing() {
        guard let text = self.text,
              text.isEmpty
        else {
            rightView?.isHidden = false
            return
        }
        rightView?.isHidden = true
    }

    @objc func textFieldDidChangeSelection() {
        guard let text = self.text,
              text.isEmpty
        else {
            rightView?.isHidden = false
            return
        }
        rightView?.isHidden = true
    }
}
