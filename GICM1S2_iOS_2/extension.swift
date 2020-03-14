//
//  extension.swift
//  GICM1S2_iOS_2
//
//  Created by Senghak on 3/13/20.
//  Copyright © 2020 Senghak. All rights reserved.
//

import UIKit
extension UIView {
    func setAnchorTop(top:NSLayoutYAxisAnchor? = nil,left:NSLayoutXAxisAnchor? = nil, bottom:NSLayoutYAxisAnchor? = nil,right:NSLayoutXAxisAnchor?=nil){
        setConstrain(top: top, left: left, bottom: bottom, right: right, topConst: 0, leftConst: 0, bottonConstr: 0, rightConst: 0)
        
    }
    func setConstrain(top:NSLayoutYAxisAnchor? = nil,left:NSLayoutXAxisAnchor? = nil, bottom:NSLayoutYAxisAnchor? = nil,right:NSLayoutXAxisAnchor?=nil, topConst:CGFloat = 0, leftConst: CGFloat = 0, bottonConstr: CGFloat = 0, rightConst: CGFloat = 0){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConst).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: leftConst).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant:  bottonConstr).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: rightConst).isActive = true
        }
    }
}


