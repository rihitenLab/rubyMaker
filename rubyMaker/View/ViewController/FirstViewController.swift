//
//  FirstViewController.swift
//  rubyMaker
//
//  Created by ri-matsuoka on 2019/04/14.
//  Copyright © 2019年 ri-matsuoka. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!
    
    @IBOutlet private weak var label: UILabel!
    
    var convertToFuriganaModel: ConvertToFuriganaModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        self.convertToFuriganaModel = appDelegate.convertToFuriganaModel
        self.convertToFuriganaModel.addDelegate(className: String(describing: type(of: self)), delegate: self)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.convertToFuriganaModel.removeDelegate(className: String(describing: type(of: self)))
    }
    
    @IBAction func convFurigana() {
        if let text = self.textField.text {
            self.convertToFuriganaModel.convertToFurigana(sentence: text)
        }
    }

}

extension FirstViewController: ConvertToFuriganaDelegate {
    func onSuccess(furigana: String) {
        self.label.text = furigana
    }
    
    func onFailure(error: Error?) {
        
    }
}
