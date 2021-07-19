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
    // 이름과 현상금 리스트를 따로 만들어서 관리가 어렵고 새로 추가하기가 어렵다. → 수정과 재사용이 어려움 → 기술부채 발생
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Segue를 수행하기 직전에 준비. DetailViewController한테 데이터를 보냄
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                vc?.name = nameList[index]
                vc?.bounty = bountyList[index]
            }
        }
    }
    
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
//        Cell이 클릭되었을 때
        print("--> \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row) // Segue를 수행 - 직전에 prepare이 수행됨. sender에 indexPath의 번호를 전달
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLable: UILabel!
}
