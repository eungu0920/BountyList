//
//  BountyViewController.swift
//  BountyList
//
//  Created by 은구 on 2021/07/17.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    UITableViewDataSource, UITableViewDelegate
    
    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    let bountyList = [33000000, 50, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
//    UITableViewDataSource
//    TableView의 Connections inspector에서 View Controller와 DataSource와 Delegate연결
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
//        array의 갯수를 리턴
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
//            nil이 아닌경우에 ListCell로 캐스팅 cell.
        }
        let img = UIImage(named: "\(nameList[indexPath.row]).jpg") // 이미지를 가져옴
        cell.imgView.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountyLable.text = "\(bountyList[indexPath.row])"
        
        return cell
    }
    
    /*
     if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
        let img = UIImage(named: "\(nameList[indexPath.row]).jpg") // 이미지를 가져옴
        cell.imgView.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountyLable.text = "\(bountyList[indexPath.row])"
        return cell
     } else {
        return UITableViewCell()
     } 위 guard let else와 동일
     */
    
//    UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLable: UILabel!
}
