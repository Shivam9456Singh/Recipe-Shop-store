import UIKit
import Foundation

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        let vc1 = UINavigationController(rootViewController: DiningViewController())
        let vc2 = UINavigationController(rootViewController: GroceryViewController())
        let vc3 = UINavigationController(rootViewController: ProfileViewController())
        
        

        vc1.tabBarItem.image = UIImage(systemName: "fork.knife")
        vc2.tabBarItem.image = UIImage(systemName: "bag")
        vc3.tabBarItem.image = UIImage(systemName: "person.fill")

        vc1.title = "Recipies"
        vc2.title = "Groceries"
        vc3.title = "Profile"
        
        
        view.tintColor = .systemRed
        
        setViewControllers([vc1,vc2,vc3], animated: true)
        tabBar.isTranslucent = false
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController){
        guard let tabBarItemView = viewController.tabBarItem.value(forKey: "view") as? UIView else{
            return
        }
        
        UIView.animate(withDuration: 0.15, animations: {
            tabBarItemView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) {
            _ in
            UIView.animate(withDuration: 0.15, animations: {
                tabBarItemView.transform = CGAffineTransform.identity
            })
        }
    }
   
}
