//
//  FirstViewController.swift
//  rubyMaker
//
//  Created by ri-matsuoka on 2019/04/14.
//  Copyright © 2019年 ri-matsuoka. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // 変換元文字列
    @IBOutlet private weak var textView: UITextView!
    
    // 変換後文字列
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // ルビを振る処理
    @IBAction func convFurigana() {
        if let text = self.textView.text {
            self.convertToFuriganaModel.convertToFurigana(sentence: text)
        }
    }
    
    // クリップボードへコピー
    @IBAction func copyText() {
        UIPasteboard.general.string = label.text
    }
}

extension MainViewController: ConvertToFuriganaDelegate {
    func onSuccess(furigana: String) {
        self.label.text = furigana
    }
    
    func onFailure(error: Error?) {
        let alert: UIAlertController = UIAlertController(title: "通信エラー", message: "ルビを触れませんでした。", preferredStyle:  UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
        
        present(alert, animated: true, completion: nil)
    }
}
