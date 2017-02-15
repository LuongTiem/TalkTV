//
//  CategoryVC.swift
//  TalkTV
//
//  Created by ReasonAmu on 2/9/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import UIKit

class CategoryVC: BaseTabHomeVC {
    lazy var categoryVM: CategoryVM = CategoryVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        
        let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.setCollectionViewLayout(layout, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension CategoryVC {
    
    override func loadData() {
        baseVM = self.categoryVM
        categoryVM.requestData {
            self.collectionView.reloadData()
            self.loadDataFinished()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.categoryModel = categoryVM.datas[indexPath.row]
        return cell
    }
    
 
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIDevice.current.orientation.isLandscape == true {
             let widthLandscape = (collectionView.frame.width - 50)/3
            return CGSize(width: widthLandscape  , height: (widthLandscape*3)/2)
        }
        let width = (collectionView.frame.width - 30)/2
        return CGSize(width: width, height: (width*3)/2)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}
