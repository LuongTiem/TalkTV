//
//  BaseTabHomeVC.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/15/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import UIKit
import CarbonKit

class BaseTabHomeVC: BaseVC {
    
    var baseVM : BaseVM!
    var lastContentOffset : CGFloat = 100
    var refresh : CarbonSwipeRefresh? = nil
    
    lazy var collectionView : UICollectionView  = {
        let layout =  UICollectionViewFlowLayout()
                    layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(UINib(nibName: "SongCell", bundle: nil), forCellWithReuseIdentifier: "SongCell")
        
        return collectionView
    }()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.addSubview(refresh!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension BaseTabHomeVC {
    
    override func setupUI() {
        contentView = collectionView
        // Do any additional setup after loading the view.
        refresh   =  CarbonSwipeRefresh.init(scrollView: self.collectionView)
        refresh?.colors = [UIColor.red , UIColor.blue]
        view.backgroundColor = BGCOLOR
        view.addSubview(collectionView)
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        
        refresh?.addTarget(self, action: #selector(handlePullRefresh), for: .valueChanged)
        
        super.setupUI()
        
    }
    
    //- base load
    func loadData(){
        
    }
    
    //MARK- PULL REFRESH
    func handlePullRefresh(){
        self.resetData()
        self.baseVM.datas.removeAll()
        self.collectionView.reloadData()
        self.loadData()
        self.refresh?.endRefreshing()
    }
    
    

    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    
}

extension BaseTabHomeVC : UICollectionViewDelegateFlowLayout , UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIDevice.current.orientation.isLandscape == true {
            
            let width = (collectionView.frame.width-30)/2
            return CGSize(width: width , height: (width*2)/3)
        }
        
        return CGSize(width: (collectionView.frame.width) , height: ((collectionView.frame.width)*2)/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
        if UIDevice.current.orientation.isLandscape == true {
            
           return 10
        }
        
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if baseVM.datas.count > 0  {
            return baseVM.datas.count
        } else {
            return 0
        }
    
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if self.lastContentOffset > scrollView.contentOffset.y && self.lastContentOffset < (scrollView.contentSize.height - scrollView.frame.height){
            
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            
        }
        
        if self.lastContentOffset < scrollView.contentOffset.y && scrollView.contentOffset.y > 0{
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            
        }
        
        self.lastContentOffset = scrollView.contentOffset.y
        
        
        
    }
}

extension BaseTabHomeVC : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SongCell", for: indexPath) as! SongCell
        cell.songModel = baseVM.datas[indexPath.row]
        return cell
    }
    
}
