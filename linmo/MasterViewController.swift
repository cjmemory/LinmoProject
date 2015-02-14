//
//  MasterViewController.swift
//  CustomUITableViewCell
//
//  Created by Debasis Das on 12/26/14.
//  Copyright (c) 2014 Knowstack. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var objects = NSMutableArray()
    var dataArray = [["firstName":"Debasis","lastName":"Das","email":"debasis_das@knowstack.com"],["firstName":"John","lastName":"Doe","email":"jdoe@knowstack.com"],["firstName":"Jane","lastName":"Doe","email":"janedoe@knowstack.com"],["firstName":"Mary","lastName":"Jane","email":"mjane@knowstack.com"]]
 
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let object = dataArray[indexPath.row] as NSDictionary
        (cell.contentView.viewWithTag(10) as UILabel).text = object["firstName"] as? String
        (cell.contentView.viewWithTag(11) as UILabel).text = object["lastName"] as? String
        (cell.contentView.viewWithTag(12) as UILabel).text = object["email"] as? String
        (cell.contentView.viewWithTag(100) as UIImageView).image = UIImage(named: "person.png")
        (cell.contentView.viewWithTag(200) as UIImageView).image = UIImage(named: "remove.png")
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }



}

