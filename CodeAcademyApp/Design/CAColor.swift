import UIKit

enum CAColor: Int {
    case gray
    case lightGray
    case lightYellow
    case darkYellow
    case darkBrown
    case green
    case white
    case red
    case clear

    func colorValue(alpha: CGFloat = 1.0) -> UIColor? {
        switch self {
        case .gray:
            return UIColor(hexString: "#374045")
        case .lightYellow:
            return UIColor(hexString: "#E1D89F")
        case .darkYellow:
            return UIColor(hexString: "#D89216")
        case .darkBrown:
            return UIColor(hexString: "#2C061F")
        case .green:
            return UIColor(hexString: "#16C79A")
        case .lightGray:
            return .lightGray
        case .white:
            return .white
        case .red:
            return .red
        case .clear:
            return .clear
        }
    }
}

func Color(_ color: CAColor, alpha: CGFloat = 1.0) -> UIColor? {
    color.colorValue(alpha: alpha)
}
