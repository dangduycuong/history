//
//  SplashViewController.swift
//  history
//
//  Created by cuongdd on 11/4/25.
//

import UIKit

class SplashViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigateToHomeScreen()
    }
    
    private func navigateToHomeScreen() {
        guard let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive || $0.activationState == .foregroundInactive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first else { return }
        let tabbarVC = MenuTabbarViewController()
        let navigationController = UINavigationController(rootViewController: tabbarVC)
        navigationController.setNavigationBarHidden(true, animated: false)
        keyWindow.rootViewController = navigationController
        keyWindow.makeKeyAndVisible()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
