//
//  ViewController.swift
//  GICM1S2_iOS_2
//
//  Created by Senghak on 3/13/20.
//  Copyright © 2020 Senghak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btntableView: UIButton!
    @IBOutlet weak var btnViewCell: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btntableView.layer.cornerRadius = 20
        btnViewCell.layer.cornerRadius = 20
    }

   
    @IBAction func gotoViewCell(_ sender: Any) {
        let vcell = ViewCellController()
        navigationController?.pushViewController(vcell, animated: true)
    }
    
    @IBAction func gotoTableView(_ sender: Any) {
        let tblview = tableViewController()
        navigationController?.pushViewController(tblview, animated: true)
    }
    
//    @IBAction func goto_table_View(_ sender: Any) {
//        let tbView = ViewCellController()
//        navigationController?.pushViewController(tbView, animated: true)
//    }
    
    
}


