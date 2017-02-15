//
//  NavigationController.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/9/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.interactivePopGestureRecognizer?.delegate = nil
        self.navigationBar.isTranslucent  = false //
        UINavigationBar.appearance().barTintColor = UIColor.red // mau navi
        UINavigationBar.appearance().shadowImage = UIImage() // phan gach chan __
        UINavigationBar.appearance().setBackgroundImage(UIImage.init(), for : UIBarMetrics.default) // nen navi
    
        self.hidesBarsOnSwipe = true
    }

    
    //MARK: - PUSH
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        //        print("Count viewcontrollers: \(self.viewControllers.count)")
        viewController.navigationItem.titleView = titleViews()
        if self.viewControllers.count < 1 {
            
            if viewController.isKind(of: HomeVC.self) {
                viewController.navigationItem.rightBarButtonItems = [setRightButton(),setBackButtonItem()]
            }
            
            
        } else{
            
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = setBackButtonItem()
        }
        
        
        
        super.pushViewController(viewController, animated: true)
        
    }
    
    
    //MARK: - SET BACK BUTTON
    
    func setBackButtonItem() -> UIBarButtonItem {
        
        let backButtonItem  = UIButton(type: .custom)
        backButtonItem.setImage(UIImage(named: "setting_back"), for: .normal)
        backButtonItem.setTitleColor(UIColor.black, for: .normal)
        backButtonItem.sizeToFit()
        backButtonItem.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        backButtonItem.addTarget(self, action: #selector(handleBackClick), for: .touchUpInside)
        
        return UIBarButtonItem.init(customView: backButtonItem)
        
        
    }
    
    //MARK: - SET RIGHT BUTTON ITEM
    
    func setRightButton() -> UIBarButtonItem {
        
        let searchItem = UIButton.init(type: .custom)
        searchItem.setImage(UIImage(named: "searchbutton_nor"), for: .normal)
        searchItem.sizeToFit()
        searchItem.frame.size = CGSize(width: 30, height: 30)
        searchItem.contentHorizontalAlignment = .right
        searchItem.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        return UIBarButtonItem.init(customView: searchItem)
        
    }
    
    
    //MARK: - TITLEVIEW
    
    func titleViews() -> UIImageView{
        let imageViews = UIImageView(image: UIImage(named: "title_image"))
        imageViews.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        imageViews.contentMode = .scaleAspectFit
        return imageViews
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension NavigationController {
    
    func handleBackClick(){
        self.popViewController(animated: true)
    }
    
    func handleSearch(){
        print("Search")
    }
}
