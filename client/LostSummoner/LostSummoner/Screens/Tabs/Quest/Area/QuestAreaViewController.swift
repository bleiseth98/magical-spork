//
//  QuestAreaViewController.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import UIKit

class QuestAreaViewController: UIViewController {
    //::: UIKit Source :::
    let backgroundView = UIView()
    let backButton = UIButton.standard()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        setUI()
        // Do any additional setup after loading the view.
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
