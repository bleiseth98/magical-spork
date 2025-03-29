//
//  QuestListViewController.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import UIKit

class QuestListViewController: UIViewController {
    //::: UIKit Source :::
    let tableView = UITableView()
    var notificationView = UIView()
    let refillButton = UIButton.standard()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        setUI()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
