//
//  MenuTabbarViewController.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import UIKit

class MenuTabbarViewController: UITabBarController, UITabBarControllerDelegate {
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    var dynastyVC: DynastyViewController!
    var timelineVC: TimelineViewController!
    var personVC: PersonViewController!
    var territoryVC: TerritoryViewController!
    var storiesVC: StoriesViewController!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.delegate = self
        
        navigationController?.navigationItem.title = "Tabbar"
        
        dynastyVC = DynastyViewController()
        timelineVC = TimelineViewController()
        personVC = PersonViewController()
        territoryVC = TerritoryViewController()
        storiesVC = StoriesViewController()
        
        dynastyVC.tabBarItem.image = R.image.dynasty(compatibleWith: nil)
        dynastyVC.tabBarItem.selectedImage = R.image.dynasty()
        
        timelineVC.tabBarItem.image = R.image.timeline()
        timelineVC.tabBarItem.selectedImage = R.image.timeline()
        
        personVC.tabBarItem.image = R.image.king()
        personVC.tabBarItem.selectedImage = R.image.king()
        
        territoryVC.tabBarItem.image = R.image.territory()
        territoryVC.tabBarItem.selectedImage = R.image.territory()
        
        storiesVC.tabBarItem.image = R.image.story()
        storiesVC.tabBarItem.selectedImage = R.image.story()
        
        viewControllers = [dynastyVC, timelineVC, personVC, territoryVC, storiesVC]
        
        if let items = tabBar.items {
            for i in 0..<items.count {
                items[i].title = TabbarTitle.all[i].text
                items[i].imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            }
        }
        
        //        for i in 0..<tabBar.items!.count {
        //            tabBar.items![i].title = TabbarTitle.all[i].text
        //            tabBar.items![i].imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        //        }
        let tabBarBottomView = UIView()
        tabBarBottomView.backgroundColor = UIColor.white
        view.layout(tabBarBottomView)
            .top(tabBar)
            .left()
            .bottom()
            .right()
        view.bringSubviewToFront(tabBar)
    }
    
    //MARK: UITabbar Delegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        //        if viewController.isKind(of: DynastyViewController.self) {
        //            let vc =  R.storyboard.person.personDetailViewController()!
        //            vc.modalPresentationStyle = .overFullScreen
        //            self.present(vc, animated: true, completion: nil)
        //            return false
        //        }
        
        if viewController.isKind(of: DynastyViewController.self) {
            print("cdd dang o DynastyViewController")
        }
        return true
    }
    
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        //This method will be called when user changes tab.
        print("cdd didSelectItem")
        print(item.selectedImage as Any)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Selected item")
        
        if let index = tabBar.items?.firstIndex(of: item) {
            tabBarController?.title = "\(index)"
        }
        
    }
    
    // UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let index = tabBarController.viewControllers?.firstIndex(of: viewController) {
            tabBarController.title = TabbarTitle.all[index].text
        }
        print("Selected view controller")
        //        viewController.title = "hh" // action khi vc được chọn
        
    }
    
    
}

enum TabbarTitle {
    case dynasty
    case timeline
    case person
    case territory
    case stories
    
    static let all = [dynasty, timeline, person, territory, stories]
    
    var text: String {
        get {
            switch self {
            case .dynasty:
                return "Dynasty"
            case .timeline:
                return "Timeline"
            case .person:
                return "Person"
            case .territory:
                return "Territory"
            case .stories:
                return "Stories"
            }
        }
    }
}

