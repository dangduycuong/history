//
//  TimelineViewController.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import UIKit

class TimelineViewController: BaseViewController {
    override func loadView() {
        super.loadView()
        prepareForViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    private func prepareForViewController() {
        addBackground()
        
    }

}
