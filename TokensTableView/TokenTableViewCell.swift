//
//  TokenTableViewCell.swift
//  TokensTableView
//
//  Created by HHasaneen on 2/14/19.
//  Copyright © 2019 msaad. All rights reserved.
//

import UIKit

class TokenTableViewCell: UITableViewCell {

    @IBOutlet weak var criteriaLabel: UILabel!
    @IBOutlet weak var taglistCollection: TaglistCollection!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTaglistView()
        // Initialization code
    }
    
    func setupTaglistView() {
        
        self.taglistCollection.setupTagCollection()
        self.taglistCollection.delegate = self
        self.taglistCollection.textFont = UIFont.systemFont(ofSize: 15.0, weight: .heavy)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TokenTableViewCell:TagViewDelegate{
    func didRemoveTag(_ indexPath: IndexPath) {
        print("RemoveIndexPath==\(indexPath)")
    }
    
    func didTaponTag(_ indexPath: IndexPath) {
        //print("Tag tapped: \(self.aryTeglist[indexPath.item])")
    }
}
