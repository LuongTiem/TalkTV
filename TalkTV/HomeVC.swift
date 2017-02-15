//
//  HomeVC.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/9/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import UIKit
import CarbonKit


class HomeVC: UIViewController, CarbonTabSwipeNavigationDelegate{
    var carbonTabSwipeNavigation: CarbonTabSwipeNavigation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        setup()
        
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print(size)
        
        carbonTabSwipeNavigation?.setTabExtraWidth(view.frame.width)
        carbonTabSwipeNavigation?.carbonSegmentedControl?.setWidth(size.width/4, forSegmentAt: 0)
        carbonTabSwipeNavigation?.carbonSegmentedControl?.setWidth(size.width/4, forSegmentAt: 1)
        carbonTabSwipeNavigation?.carbonSegmentedControl?.setWidth(size.width/4, forSegmentAt: 2)
        carbonTabSwipeNavigation?.carbonSegmentedControl?.setWidth(size.width/4, forSegmentAt: 3)
    }
    
    func setup () {
        let item = [#imageLiteral(resourceName: "menu_yule_sel"), #imageLiteral(resourceName: "menu_homepage_sel"), #imageLiteral(resourceName: "menu_youxi_sel"),#imageLiteral(resourceName: "menu_goddess_sel")]
        
        carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: item, delegate: self)
        carbonTabSwipeNavigation?.setIndicatorColor(UIColor.white)
        carbonTabSwipeNavigation?.carbonSegmentedControl?.backgroundColor = DARKCOLOR
        carbonTabSwipeNavigation?.insert(intoRootViewController: self)
        carbonTabSwipeNavigation?.setTabExtraWidth(view.frame.width)
        carbonTabSwipeNavigation?.carbonSegmentedControl?.setWidth(view.frame.width/4, forSegmentAt: 0)
        carbonTabSwipeNavigation?.carbonSegmentedControl?.setWidth(view.frame.width/4, forSegmentAt: 1)
        carbonTabSwipeNavigation?.carbonSegmentedControl?.setWidth(view.frame.width/4, forSegmentAt: 2)
        carbonTabSwipeNavigation?.carbonSegmentedControl?.setWidth(view.frame.width/4, forSegmentAt: 3)
        
        view.addSubview(menuBar)
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuBar.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: -50).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.backgroundColor = BGCOLOR

        
    }
    
    
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        
        let live = LiveVC.init()
        let showbiz = SongVC.init()
        let game = GameVC.init()
        let category = CategoryVC.init()
        
        
        switch index {
        case 0:
            return live
        case 1:
            return showbiz
        case 2:
            return game
        case 3 :
            return category
        default:
            return live
        }
        
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, willMoveAt index: UInt) {
       
        
        let live = LiveVC.init()
        let showbiz = SongVC.init()
        let game = GameVC.init()
        let category = CategoryVC.init()
        
        switch index {
        case 0:
            return live.updateFocusIfNeeded()
        case 1:
            return showbiz.updateFocusIfNeeded()
        case 2:
            return game.updateFocusIfNeeded()
        case 3 :
            return category.updateFocusIfNeeded()
        default:
            return live.updateFocusIfNeeded()
        }
        
        
    }
    

 
    
    
    lazy var menuBar : UIView = {
        let views = UIView()
        views.backgroundColor = DARKCOLOR
        views.translatesAutoresizingMaskIntoConstraints  = false
        return views
    }()
    
    
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
