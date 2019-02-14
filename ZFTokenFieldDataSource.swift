//
//  ZFTokenFieldDataSource.swift
//  TokensTableView
//
//  Created by msaad on 2/11/19.
//  Copyright © 2019 msaad. All rights reserved.
//

import Foundation
import UIKit
class ZFTokenFieldDataProvider: NSObject,ZFTokenFieldDataSource , ZFTokenFieldDelegate {
    
    var tokens: [String] = []
    let configureCell: () -> ()
    init(configureCell: @escaping () -> ()) {
        self.configureCell = configureCell
    }
    func lineHeightForToken(in tokenField: ZFTokenField!) -> CGFloat {
        return 40
    }
    
    func numberOfToken(in tokenField: ZFTokenField!) -> UInt {
        return UInt(bitPattern: self.tokens.count)
    }
    
    func tokenMarginInToken(in tokenField: ZFTokenField!) -> CGFloat {
        return 5
    }
    
    //arrayOfheights[]
    func tokenField(_ tokenField: ZFTokenField!, didReturnWithText text: String!) {
        self.tokens.append(text)
        tokenField.reloadData()
//        tableView.beginUpdates()
//        tableView.endUpdates()
        self.configureCell()
    }
    
    func tokenField(_ tokenField: ZFTokenField!, didRemoveTokenAt index: UInt) {
        self.tokens.remove(at: Int(bitPattern: index))
        tokenField.reloadData()
        //        tableView.beginUpdates()
        //        tableView.endUpdates()
    }
    
    func tokenFieldShouldEndEditing(_ textField: ZFTokenField!) -> Bool {
        return true
    }
    func tokenField(_ tokenField: ZFTokenField!, viewForTokenAt index: UInt) -> UIView! {
        
        let nibContents = Bundle.main.loadNibNamed("TokenView", owner: nil, options: nil)
        let view = nibContents![0] as! UIView
        let label = view.viewWithTag(2) as! UILabel
        let button = view.viewWithTag(3) as! UIButton
        button.addTarget(self, action: #selector(tokenDeleteButtonPressed), for: .touchUpInside)
        label.text = self.tokens[Int(bitPattern: index)]
        let size = label.sizeThatFits(CGSize(width: tokenField.frame.size.width, height: tokenField.frame.size.height))
        for subview in view.subviews {
            AppDelegate.flipContent(view: subview)
        }
        view.frame = CGRect(x: 0, y: 50, width: size.width + 97, height: 40)
        
        return view
    }
    
    @objc func tokenDeleteButtonPressed(tokenButton: UIButton) {
        let token = tokenButton.superview as UIView?
        let tokenField = token!.superview as! ZFTokenField
        let index = tokenField.index(ofTokenView: token!)
        if index != NSNotFound {
            self.tokens.remove(at: Int(bitPattern: index))
//            tableView.beginUpdates()
//            tableView.endUpdates()
            self.configureCell()
            tokenField.reloadData()
        }
//        tableView.beginUpdates()
//        tableView.endUpdates()
        self.configureCell()
        tokenField.reloadData()
        if tokenField.numberOfToken() == 0 {
            tokenField.floatingLabel.text = ""
            tokenField.textField.placeholder = "enter something"
        }
    }
    func tokenFieldDidBeginEditing(_ tokenField: ZFTokenField!) {
        
        let placeholder = (tokenField.textField.placeholder)!
        if tokenField.numberOfToken() == 0 && placeholder == "enter something"{
            tokenField.floatingLabel.text = tokenField.textField.placeholder
            tokenField.textField.placeholder = ""
        }
        self.configureCell()
    }
    func tokenFieldDidEndEditing(_ tokenField: ZFTokenField!) {
        if tokenField.numberOfToken() == 0 && tokenField.textField.text != ""{
            
        }
        else if tokenField.numberOfToken() == 0 {
            tokenField.floatingLabel.text = ""
            tokenField.textField.placeholder = "enter something"
        }
    }
    func tokenField(_ tokenField: ZFTokenField!, didTextChanged text: String!) {
        self.configureCell()
    }
}
