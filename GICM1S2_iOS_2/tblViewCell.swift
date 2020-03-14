//
//  tblViewCell.swift
//  GICM1S2_iOS_2
//
//  Created by Senghak on 3/14/20.
//  Copyright © 2020 Senghak. All rights reserved.
//

import UIKit

class tblViewCell: UITableViewCell {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var sadowView: UIImageView!
    
    // Declaration
   // let shadowSize: CGFloat = 20
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.cornerRadius = 2
        imageV.layer.cornerRadius = imageV.frame.size.width/2
        imageV.layer.borderWidth = 2
        imageV.layer.borderColor = UIColor.systemRed.cgColor
        
        
        sadowView.layer.shadowPath = UIBezierPath(rect: sadowView.bounds).cgPath
        sadowView.layer.shadowRadius = 5
        sadowView.layer.shadowOffset = .zero
        sadowView.layer.shadowOpacity = 1
        
       // sadowView.layer.shadowPath = UIBezierPath(ovalIn: <#T##CGRect#>)
        
        
        //--
//        lblMessage.layer.cornerRadius = 10
//        //lblMessage.layer.borderWidth = 1
//        lblMessage.layer.borderColor = UIColor.systemGreen.cgColor
//
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}



