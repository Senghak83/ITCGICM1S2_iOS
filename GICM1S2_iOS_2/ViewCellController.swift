//
//  ViewCellController.swift
//  GICM1S2_iOS_2
//
//  Created by Senghak on 3/13/20.
//  Copyright © 2020 Senghak. All rights reserved.
//

import UIKit

class ViewCellController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    let cell1 = "GuidCell"
    let login = "LoginGuid"
  
    let page : [PageView]  = {
        let p1 = PageView(imaggeName: "image1",title: "Show Image Page 1",message: "Load Image 1")
        let p2 = PageView(imaggeName: "image2", title: "Show Image page 2", message: "Load Image 2")
        let p3 = PageView(imaggeName: "m1", title: "Show Image page 2", message: "Load Image 3")
        let p4 = PageView(imaggeName: "m2", title: "Show Image page 2", message: "Load Image 4")
        
        return [p1,p2,p3,p4]
    }()

    // create UICollectionView
   lazy var myColletion: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0.2
    
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // add cell
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .red
        cv.isPagingEnabled = true
        
        return cv
    }()
    
    //-- PageControllerView
    lazy var myPageControl : UIPageControl = {
       let p = UIPageControl()
        p.pageIndicatorTintColor = .lightGray
        p.currentPageIndicatorTintColor = .blue
        //p.numberOfPages = 4
        p.numberOfPages = self.page.count + 1
        
        return p
    }()
    
    let btnSkip: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("skip", for: .normal)
        btn.backgroundColor = .cyan
        
        return btn
    }()
    
    //---
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(myColletion)
        view.addSubview(myPageControl)
        view.addSubview(btnSkip)
        // set Constran
        //myColletion.frame = view.frame
        
        myColletion.setAnchorTop(top: view.topAnchor, left: view.leftAnchor, bottom: myPageControl.topAnchor, right: view.rightAnchor)
        myPageControl.setConstrain(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor,topConst: 0,leftConst: 0,bottonConstr: 0,rightConst: 30)
        
//        btnSkip.setConstrain(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConst: 0, leftConst: 60, bottonConstr: 70, rightConst: 2)
        
        //btnSkip.setAnchorTop(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor)
        //myPageControl.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true

        
        
        
       // myColletion.frame = view.frame
        
        // -- register cell
        registerCell()
        
    }
    func registerCell(){
        myColletion.register(GuidCell.self, forCellWithReuseIdentifier: cell1)
        myColletion.register(UICollectionViewCell.self, forCellWithReuseIdentifier: login)

    }

    
    //-- Overide method Datasour Delig
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return page.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == page.count {
            let loginGuid = collectionView.dequeueReusableCell(withReuseIdentifier: login, for: indexPath)
            return loginGuid
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell1, for: indexPath)as! GuidCell
        let p = page[indexPath.item]
        cell.page = p
        //cell.backgroundColor = .blue
        return cell
    }
    
    //--- set size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    //-- select point
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        myPageControl.currentPage = pageNumber
    }
    
}

