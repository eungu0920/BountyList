//
//  DetailViewController.swift
//  BountyList
//
//  Created by 은구 on 2021/07/19.
//

import UIKit

class DetailViewController: UIViewController {
    
    //    --- MVVM - Design Pattern ---
    //    Model
    //    - BountyInfo
    //    > BountyInfo 만들기
        
    //    View
    //    - imgView, nameLabel, bountyLabel
    //    > view들은 ViewModel을 통해서 구성이 되어야함
        
    //    ViewModel
    //    - DetailViewModel
    //    > 뷰레이어에서 필요한 메소드 만들기
    //    > 모델을 가지고 있기 ... BountyInfo 들
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
//    var name: String?
//    var bounty: Int?
    
//    var bountyInfo: BountyInfo?
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI() // View가 띄워지기전에 호출이 되어야함
        
    }
    
    func updateUI() {
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
        
//        if let name = self.name, let bounty = self.bounty {
//            let img = UIImage(named: "\(name).jpg")
//            imgView.image = img
//            nameLabel.text = name
//            bountyLabel.text = "\(bounty)"
//        }
    }
    
    @IBAction func close(_ sender: Any) {
//        버튼을 눌렀을 때 뷰가 사라짐
        dismiss(animated: true, completion: nil)
        
    }
}

class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
