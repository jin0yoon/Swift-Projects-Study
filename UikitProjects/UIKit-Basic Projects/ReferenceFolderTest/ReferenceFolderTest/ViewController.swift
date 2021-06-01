//
//  ViewController.swift
//  ReferenceFolderTest
//
//  Created by 윤진영 on 2021/05/31.
//

import UIKit

class ViewController: UIViewController {
    
    var arrECC : NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let eccFolderPath = Bundle.main.resourcePath! + "/ECC"
        
        let fileManager = FileManager.default
        
        do{
            arrECC = try fileManager.contentsOfDirectory(atPath: eccFolderPath) as NSArray
            print(arrECC)
        }catch let error{
            print(error.localizedDescription)
        }
    }


}

