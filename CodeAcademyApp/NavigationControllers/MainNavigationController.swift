import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationBar.prefersLargeTitles = true
        navigationBar.isTranslucent = true
        navigationBar.tintColor = .white
        navigationBar.barTintColor = .white
        tabBarController?.tabBar.isHidden = true
    }
}
