//
//  LoadingViewController.swift
//  history
//
//  Created by cuongdd on 27/02/2024.
//

import UIKit

class LoadingViewController: BaseViewController {

    private lazy var animationView: LottieAnimationView = {
        let jsonName = "animation_loading"
        let animation = LottieAnimation.named(jsonName)
        let view = LottieAnimationView(animation: animation)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.alpha = 0.5
        let centerView = UIView()
        view.layout(centerView)
            .center()
            .width(44)
            .height(44)
        
        centerView.layout(animationView)
            .top()
            .left()
            .bottom()
            .right()
        animationView.play()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    deinit {
        print("----release")
    }

}
