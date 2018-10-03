//
//  TableViewController.swift
//  FirstProjectWithFireBase
//
//  Created by Thai Thi Tu Trinh on 9/28/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit
import Firebase
class TableViewController: UITableViewController {
    let nameRef = Database.database().reference(withPath: "users")
    var name = ""
    var email = ""
    
//    ref.queryOrdered(byChild: "completed").observe(.value, with: { snapshot in
//    var newItems: [GroceryItem] = []
//    for child in snapshot.children {
//    if let snapshot = child as? DataSnapshot,
//    let groceryItem = GroceryItem(snapshot: snapshot) {
//    newItems.append(groceryItem)
//    }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameRef.child("user1").observeSingleEvent(of: .value, with: { (snapshot) in
            let userDict = snapshot.value as! [String: Any]
            self.name = userDict["name"] as! String
            self.email = userDict["email"] as! String
        })
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.ibName.text =  self.name
        cell.ibEmail.text =  self.email

        return cell
    }
    
    
    



}
