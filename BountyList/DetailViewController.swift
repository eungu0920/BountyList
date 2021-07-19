//
//  DetailViewController.swift
//  BountyList
//
//  Created by 은구 on 2021/07/19.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    var name: String?
    var bounty: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI() // View가 띄워지기전에 호출이 되어야함
        
    }
    
    func updateUI() {
        if let name = self.name, let bounty = self.bounty {
            let img = UIImage(named: "\(name).jpg")
            imgView.image = img
            nameLabel.text = name
            bountyLabel.text = "\(bounty)"
        }
    }
    
    @IBAction func close(_ sender: Any) {
//        버튼을 눌렀을 때 뷰가 사라짐
        dismiss(animated: true, completion: nil)
        
    }
}
