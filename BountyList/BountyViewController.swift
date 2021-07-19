//
//  BountyViewController.swift
//  BountyList
//
//  Created by 은구 on 2021/07/17.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    UITableViewDataSource, UITableViewDelegate
    
//    --- MVVM - Design Pattern ---
//    Model
//    - BountyInfo
//    > BountyInfo 만들기
    
//    View
//    - ListCell
//    > ListCell에 필요한 정보를 ViewModel에서 받아오게 만들기
//    > ListCell은 ViewModel로 부터 받은 정보로 뷰 업데이트하기
    
//    ViewModel
//    - BountyViewModel
//    > BountyViewModel 만들고, 뷰레이어에서 필요한 메소드 만들기
//    > 모델을 가지고 있기 ... BountyInfo 들
    
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
//    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
//    let bountyList = [33000000, 50, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]
    // 이름과 현상금 리스트를 따로 만들어서 관리가 어렵고 새로 추가하기가 어렵다. → 수정과 재사용이 어려움 → 기술부채 발생
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Segue를 수행하기 직전에 준비. DetailViewController한테 데이터를 보냄
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                
                let bountyInfo = bountyInfoList[index]
                
                vc?.bountyInfo = bountyInfo
//                vc?.name = bountyInfo.name
//                vc?.bounty = bountyInfo.bounty
                
//                vc?.name = nameList[index]
//                vc?.bounty = bountyList[index]
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
        
        return bountyInfoList.count
//        return bountyList.count
//        array의 갯수를 리턴
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
//            nil이 아닌경우에 ListCell로 캐스팅 cell.
        }
        let bountyInfo = bountyInfoList[indexPath.row]

        cell.imgView.image = bountyInfo.image
        cell.nameLabel.text = bountyInfo.name
        cell.bountyLable.text = "\(bountyInfo.bounty)"
        
//        let img = UIImage(named: "\(nameList[indexPath.row]).jpg") // 이미지를 가져옴
//        cell.imgView.image = img
//        cell.nameLabel.text = nameList[indexPath.row]
//        cell.bountyLable.text = "\(bountyList[indexPath.row])"
        
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


struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
