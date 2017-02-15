//
//  TabBarController.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/9/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    let BGCOLOR: UIColor = UIColor(gray: 244)
    
    //-- khoi tao
    
    override class func initialize() {
        var attrs = [String: NSObject]()
        attrs[NSForegroundColorAttributeName] = UIColor(r: 87, g: 206, b: 138)
        // 设置tabBar字体颜色
        UITabBarItem.appearance().setTitleTextAttributes(attrs, for:.selected)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
        let backView = UIView.init()
        backView.backgroundColor = UIColor.white
        backView.translatesAutoresizingMaskIntoConstraints = false
        tabBar.insertSubview(backView, at: 0)
        
        backView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backView.heightAnchor.constraint(equalToConstant: 49).isActive = true
        backView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tabBar.isOpaque = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func addChildViewControllers() {
        setupOneChildViewController("Live", image: "menu_homepage_nor", selectedImage: "menu_homepage_sel", controller: HomeVC.init())
        setupOneChildViewController("Song", image: "menu_youxi_nor", selectedImage: "menu_youxi_sel", controller: SongVC.init())
        setupOneChildViewController("Game", image: "menu_yule_nor", selectedImage: "menu_yule_sel", controller: GameVC.init())
        setupOneChildViewController("Category", image: "menu_goddess_nor", selectedImage: "menu_goddess_sel", controller: CategoryVC.init())
        
    }
    
    
}

extension TabBarController {
    
    //-- setup children view controller
    
    func setupOneChildViewController(_ title : String, image : String, selectedImage : String, controller : UIViewController) {
        
        controller.tabBarItem.title = title
        controller.title = title
        controller.view.backgroundColor = BGCOLOR
        controller.tabBarItem.image = UIImage(named: image)
        controller.tabBarItem.selectedImage = UIImage(named: selectedImage)
        
        let navicontroller = NavigationController.init(rootViewController : controller)
        addChildViewController(navicontroller)
        
        
    }
    
}
