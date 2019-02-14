//
//  SpecialityTableViewCell.swift
//  TokensTableView
//
//  Created by msaad on 2/14/19.
//  Copyright © 2019 msaad. All rights reserved.
//

import Foundation
import UIKit
class CriteriaTableViewCell: UITableViewCell {
    @IBOutlet weak var specialityText: UILabel!
    @IBOutlet weak var checkMark: UIImageView!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        //configure(with: .none)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(criteria: String, checkStatus: CheckStatus) {
        self.specialityText.text = criteria
        self.checkMark.image = checkStatus.image
    }
}
enum CheckStatus {
    case checked
    case unchecked
    
    var image: UIImage {
        switch self {
        case .checked: return UIImage(named: "checked")!
        case .unchecked: return UIImage(named: "unchecked")!
        }
    }
}
