//
//  FirstViewController.swift
//  rubyMaker
//
//  Created by ri-matsuoka on 2019/04/14.
//  Copyright © 2019年 ri-matsuoka. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        appDelegate.convertToFuriganaModel.addDelegate(className: String(describing: type(of: self)), delegate: self)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        appDelegate.convertToFuriganaModel.removeDelegate(className: String(describing: type(of: self)))
    }

}

extension FirstViewController: ConvertToFuriganaDelegate {
    func onSuccess(furigana: String) {
        
    }
    
    func onFailure(error: Error?) {
        
    }
}
