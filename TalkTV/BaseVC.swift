//
//  BaseVC.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/14/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import UIKit

let BGCOLOR: UIColor = UIColor(gray: 244)

class BaseVC: UIViewController {
    
    var contentView : UIView?
    fileprivate lazy var loadView : UIView =  { [unowned self] in
        let view  = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
        let imageView = UIImageView(image: #imageLiteral(resourceName: "0tai_icon2-1"))
            imageView.contentMode = .center
            imageView.center = view.center
            imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 13)
        title.textColor = UIColor.black
        title.text = "Loading....."
        title.textAlignment = .center
//        title.center = CGPoint(x: imageView.center.x, y: imageView.frame.maxY+10)
//        title.bounds.size = CGSize(width: view.frame.width, height: 20)
        title.center = view.center
        title.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(imageView)
        view.addSubview(title)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        setupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}

extension BaseVC {
    
    func setupUI(){
        contentView?.isHidden = true
        view.addSubview(loadView)
        loadView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loadView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        loadView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loadView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.backgroundColor  = BGCOLOR
    }
    
    
    func loadDataFinished(){
        loadView.isHidden = true
        contentView?.isHidden = false
    }
    
    func resetData(){
        loadView.isHidden = false
        contentView?.isHidden = true
    }
}
