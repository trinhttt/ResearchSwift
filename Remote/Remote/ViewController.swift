//
//  ViewController.swift
//  Remote
//
//  Created by Thai Thi Tu Trinh on 9/6/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ibMainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
         ibMainTableView.layer.cornerRadius = 20
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            return tableView.frame.size.height / 2.7///225
        }else if indexPath.row == 1{
            return tableView.frame.size.height / 11
        }else if indexPath.row == 2{
            return tableView.frame.size.height / 5.5
        }else if indexPath.row == 3{
            return tableView.frame.size.height / 10
        }else if indexPath.row == 4{
            return tableView.frame.size.height / 10
        }else if indexPath.row == 5{
            return tableView.frame.size.height / 10
        }else{
            return 35
        }
    }
    
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DisplayDegreeTableViewCell") as! DisplayDegreeTableViewCell
            if PublicVariable.chooseButton != 0{
                cell.ibDegreeLabel.text = PublicVariable.arrDisplaytext[PublicVariable.chooseButton - 1]
            }else{
                if PublicVariable.degree == 27{
                    cell.ibDegreeLabel.text = String(PublicVariable.degree) + "℃"
                    cell.ibMinMax.text = "MAX"
                }
                else if PublicVariable.degree == 17{
                    cell.ibDegreeLabel.text = String(PublicVariable.degree) + "℃"
                    cell.ibMinMax.text = "MIN"
                }else{
                    cell.ibDegreeLabel.text = String(PublicVariable.degree) + "℃"
                    cell.ibMinMax.text = ""
                }
            }
            PublicVariable.chooseButton = 0
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LightTableViewCell") as! LightTableViewCell
            return cell
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ModeTableViewCell") as! ModeTableViewCell
            return cell
        }else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "StyleTableViewCell") as! StyleTableViewCell
            return cell
        }else if indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TimeTableViewCell") as! TimeTableViewCell
           
            return cell
        }else if indexPath.row == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SetTableViewCell") as! SetTableViewCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "BrandTableViewCell") as! BrandTableViewCell
            return cell
        }
        
    }
}

