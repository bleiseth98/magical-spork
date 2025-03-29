//
//  QuestDialogueViewController.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import UIKit

class QuestDialogueViewController: UIViewController {
    //::: UIKit Elements :::
    let speakerImage = UIImageView()
    let dialogueBox = UIView()
    let nameLabel = UILabel.header(text: "")
    let dialogue = UILabel.body(text: "")
    let backButton = UIButton.standard()
    let forwardButton = UIButton.standard()
    //Test Vars
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
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
