import UIKit

final class CAButton: UIButton {

    func styleButton(
        title: String,
        titleColor: CAColor = .white,
        image: CAIcon = .none,
        background: CAColor = .clear,
        borderColor: CAColor = .white,
        isHidden: Bool = false,
        isEnabled: Bool = true
    ) {
        setTitle(title, for: .normal)
        setTitleColor(Color(titleColor), for: .normal)
        setImage(setIcon(image), for: .normal)
        backgroundColor = Color(background)
        layer.borderColor = Color(borderColor)?.cgColor
        layer.borderWidth = buttonBorderWidth
        layer.cornerRadius = cornerRadius
        tintColor = Color(titleColor)
        self.isHidden = isHidden
        self.isEnabled = isEnabled

        if let titleLabel = titleLabel,
           let imageView = imageView
        {
            titleLabel.textAlignment = .center
            imageView.contentMode = .scaleAspectFit

            imageEdgeInsets = UIEdgeInsets(
                top: 5,
                left: titleLabel.frame.width+padding,
                bottom: 5,
                right: -titleLabel.frame.width-padding
            )

            titleEdgeInsets = UIEdgeInsets(
                top: 0,
                left: -imageView.frame.width,
                bottom: 0,
                right: imageView.frame.width
            )
        }
    }
}
