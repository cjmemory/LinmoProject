//
//  ViewController.swift
//  linmo
//
//  Created by Jie on 2/6/15.
//  Copyright (c) 2015 Jie. All rights reserved.
//

import UIKit
import Haneke

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookLogIn(sender: UIButton) {
        
        var permissions = ["public_profile"]
        
        PFFacebookUtils.logInWithPermissions(permissions, {
            (user: PFUser!, error: NSError!) -> Void in
            if user == nil {
                NSLog("Uh oh. The user cancelled the Facebook login.")
            } else if user.isNew {
                // Check whether the user already saved to Parse
                self.checkAndSaveUser()
                NSLog("User signed up and logged in through Facebook!")
                self.performSegueWithIdentifier("signInToAlreadySegue", sender: self)
            } else {
                self.checkAndSaveUser()
                NSLog("User logged in through Facebook!")
                self.performSegueWithIdentifier("signInToAlreadySegue", sender: self)
            }
        })
    }
    
    /* Check whether user already exist and Save user facebook data into Parse "User" table */
    func checkAndSaveUser() -> Void {
        getUserData({ (userData) -> Void in
            
            var query = PFQuery(className: "Account")
            query.whereKey("facebookId", equalTo: userData["id"])
            
            query.findObjectsInBackgroundWithBlock({ (objects: [AnyObject]!, error: NSError!) -> Void in
                if(error == nil) {
                    if(objects.count == 0) {
                        println("User not in Parse")
                        var user = PFObject(className: "Account")
                        user["facebookId"] = userData["id"]
                        user["firstName"] = userData["first_name"]
                        user["lastName"] = userData["last_name"]
                        user["gender"] = userData["gender"]
                        
                        user.saveInBackgroundWithBlock({ (success:Bool, error: NSError!) -> Void in
                            if(success) {
                                println("User has been saved into Parse successfully.")
                            } else {
                                println("Failed to save user data into Parse.")
                            }
                        })
                    } else {
                        println("User already exist in Parse.")
                    }
                } else {
                    println("Error: %@", error)
                }
            })
            
        })
        
    }
    
    /* Get User data */
    func getUserData(callback: (userData: AnyObject) -> Void) {
        var request = FBRequest.requestForMe();
        request.startWithCompletionHandler ({ (connection: FBRequestConnection!, result: AnyObject!, error: NSError!) -> Void in
            if(error == nil) {
                callback(userData: result as NSDictionary)
            } else {
                println("error to request facebook")
            }
        })
    }


}

