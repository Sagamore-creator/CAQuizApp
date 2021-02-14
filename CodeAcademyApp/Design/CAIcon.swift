import UIKit

enum CAIcon: Int {
    case login
    case logout
    case register
    case settings
    case save
    case leader
    case begin
    case quiz
    case trash
    case none

    func iconValue() -> UIImage? {
        switch self {
        case .login:
            return UIImage(named: "LoginIcon")
        case .logout:
            return UIImage(named: "LogoutIcon")
        case .register:
            return UIImage(named: "RegisterIcon")
        case .save:
            return UIImage(named: "SaveIcon")
        case .settings:
            return UIImage(named: "SettingsIcon")
        case .leader:
            return UIImage(named: "LeaderIcon")
        case .begin:
            return UIImage(named: "BeginIcon")
        case .quiz:
            return UIImage(named: "QuizzIcon")
        case .trash:
            return UIImage(named: "TrashIcon")
        case .none:
            return nil
        }
    }
}

func setIcon(_ icon: CAIcon) -> UIImage? {
    icon.iconValue()
}
