//
//  tableViewController.swift
//  GICM1S2_iOS_2
//
//  Created by Senghak on 3/13/20.
//  Copyright © 2020 Senghak. All rights reserved.
//

import UIKit

class tableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    // Post
    //var post:[Post]?
    var posts = [Post]()

    // Load Session
    let session = URLSession.shared
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    
    

    
    @IBOutlet weak var tblView: UITableView!
    let list = ["UserList"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tblView.dataSource = self
        tblView.delegate = self
        //tblView.register(UITableViewCell.self, forCellReuseIdentifier: "UserList")
        tblView.register(UINib(nibName: "tblViewCell", bundle: nil), forCellReuseIdentifier: "UserList")
        
        tblView.tableFooterView = UIView()
        
        // Load Data from JSON 
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            // Check the response
            //print(response as Any)
            
            // Check if an error occured
            if error != nil {
                // HERE you can manage the error
                print(error as Any)
                return
            }
            
            // Serialize the data into an object
            do {
                let json = try JSONDecoder().decode([Post].self, from: data! )
                    //try JSONSerialization.jsonObject(with: data!, options: [])
                //print(json)
                
                self.posts = json
                // reload in thread table View
                
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
                
                
                
                
                
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
            
        })
        task.resume()

        
    }
 

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserList", for: indexPath)as! tblViewCell
        
        //cell.textLabel?.text = "Row \(indexPath.row + 1)"
        
        cell.lblMessage.text = posts[indexPath.row].message
        cell.imageV.image = UIImage(named: "m1")
        
        return cell
    }


}
