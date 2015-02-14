

import UIKit

class queryResultListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var resultTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .Plain, target: self, action: "logout")
        
        resultTable.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: QueryResultCell = tableView.dequeueReusableCellWithIdentifier("matchCell") as QueryResultCell
        
        cell.username.text = "Jane"
        cell.userage.text = "25"
        cell.headImage.image = UIImage(named: "screen")
        
        return cell
    }
    
    
    func logout() {
        PFUser.logOut()
    }
    
}

