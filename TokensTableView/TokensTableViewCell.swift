//
//  TokensTableViewCell.swift
//  TokensTableView
//
//  Created by msaad on 2/11/19.
//  Copyright © 2019 msaad. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
class TokensTableViewCell: UITableViewCell {

    
    var tokenField: ZFTokenField!
    
    override func prepareForReuse() {
        super.prepareForReuse()
//                configure(with: .none)
//                self.snp.makeConstraints { (make) in
//                    make.height.equalTo(tokenField.intrinsicContentSize.height)
//               }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tokenField = ZFTokenField(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.contentView.addSubview(tokenField)
        tokenField.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(20)
            make.right.equalTo(self.contentView).offset(-20)
            make.top.equalTo(self.contentView).offset(0)
            make.bottom.equalTo(self.contentView).offset(0)
        }
        if UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft {
            
            // The app is in right-to-left mode
            self.tokenField.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
    }
}
