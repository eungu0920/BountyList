//
//  DetailViewController.swift
//  BountyList
//
//  Created by 은구 on 2021/07/19.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: Any) {
//        버튼을 눌렀을 때 뷰가 사라짐
        dismiss(animated: true, completion: nil)
        
    }
}
