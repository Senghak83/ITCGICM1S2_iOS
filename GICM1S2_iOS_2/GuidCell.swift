//
//  GuidCell.swift
//  GICM1S2_iOS_2
//
//  Created by Senghak on 3/13/20.
//  Copyright © 2020 Senghak. All rights reserved.
//

import UIKit
class GuidCell: UICollectionViewCell {
    
    var page: PageView? {
        didSet{
            guard let page = page else{
                return
            }
            myImage.image = UIImage(named: page.imaggeName)
            myText.text = page.title + "\n\n" + page.message
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //---- Image--
    let myImage : UIImageView = {
       let m = UIImageView()
        m.contentMode = .scaleToFill
        m.image = UIImage(named: "image1")
        return m
        
    }()
    // LineSeparator
    let linSep: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return v
    }()
    
    //---Text ---
    let myText : UITextView = {
       let t = UITextView()
        t.text = "Hello my Text"
        t.textAlignment = .center
        return t
        
    }()
    
    //-- set UIView into Cell
    
    func setView(){
        addSubview(myImage)
        addSubview(myText)
        addSubview(linSep)
        
        myImage.setAnchorTop(top: topAnchor, left: leftAnchor, bottom:linSep.topAnchor, right:rightAnchor)
       
        linSep.setAnchorTop(top: nil, left: leftAnchor, bottom: myText.bottomAnchor, right: rightAnchor)
        myText.setAnchorTop(top: nil,left: leftAnchor,bottom: bottomAnchor,right: rightAnchor)
        linSep.heightAnchor.constraint(equalToConstant: 1).isActive = true
        myText.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
    }
}
