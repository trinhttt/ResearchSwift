//
//  ViewController.swift
//  FirstProjectWithFireBase
//
//  Created by Thai Thi Tu Trinh on 9/28/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit
import Firebase
//https://www.raywenderlich.com/3-firebase-tutorial-getting-started
class ViewController: UIViewController {

    @IBOutlet weak var ibUserName: UITextField!
    @IBOutlet weak var ibPassWord: UITextField!
    
    @IBOutlet weak var ibShowAndHidePassButton: UIButton!
    var displayIconOpenEyes = false
    override func viewDidLoad() {
        super.viewDidLoad()
        ibPassWord.isSecureTextEntry = true
    }
    @IBAction func ibIconAction(_ sender: Any) {
        if(displayIconOpenEyes == true) {
            ibPassWord.isSecureTextEntry = false
            if let image = UIImage(named: "icEyesOpen") {
                ibShowAndHidePassButton.setImage(image, for: .normal)
            }
            
        } else {
            ibPassWord.isSecureTextEntry = true
            if let image = UIImage(named: "icEyesClose") {
                ibShowAndHidePassButton.setImage(image, for: .normal)
            }
        }
        
        displayIconOpenEyes = !displayIconOpenEyes
    }
    
    @IBAction func ibLoginAction(_ sender: Any) {
        let nameInput = ibUserName.text
        let passInput = ibPassWord.text
        var name = ""
        var pass = ""
        //let rootRef = Database.database().reference()
        let nameRef = Database.database().reference(withPath: "users")
        nameRef.child("user1").observeSingleEvent(of: .value, with: { (snapshot) in
                
                let userDict = snapshot.value as! [String: Any]
                
            name = userDict["name"] as! String
            pass = userDict["pass"] as! String
            print("-------")

            print("name: \(name)  pass: \(pass)")
            print("name: \(String(describing: nameInput))  pass: \(String(describing: passInput))")
            if nameInput == name && passInput == pass{
                print("login successful")
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
                self.present(nextViewController, animated:true, completion:nil)
            }else{
                print("fail")
            }
            })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

