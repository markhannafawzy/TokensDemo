//
//  SpecialityTableViewController.swift
//  TokensTableView
//
//  Created by msaad on 2/14/19.
//  Copyright © 2019 msaad. All rights reserved.
//

import UIKit

class CriteriaTableViewController: UITableViewController {
    var viewModel: CriteriaViewModel!
    var searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = searchController.searchBar
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.stringForDictionaryKey()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchController.isActive ? viewModel.filteredCount : viewModel.criteriaCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CriteriaTableViewCell", for: indexPath) as! CriteriaTableViewCell
        
        // Configure the cell...
        cell.configure(criteria: viewModel.criteriaItems[indexPath.row], checkStatus: CheckStatus.checked)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (self.checkedAction(sender:)))
        
        cell.checkMark.addGestureRecognizer(tapGesture)
        return cell
    }
    @objc func checkedAction(sender:UITapGestureRecognizer) {
        if let senderView = sender.view {
            let imageView = senderView as! UIImageView
            if imageView.image == CheckStatus.unchecked.image{
                ((sender.view)as! UIImageView).image = CheckStatus.checked.image
                let indexPath = self.tableView.indexPath(for: senderView.superview?.superview as! UITableViewCell)
                viewModel.chosencriteriaItems.append(viewModel.criteriaItems[(indexPath?.row)!])
            }
            else{
                ((sender.view)as! UIImageView).image = CheckStatus.unchecked.image
            }
        }
    }
}

extension CriteriaTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text ?? ""
        viewModel.filterSearchController(with: searchString)
        self.tableView.reloadData()
    }
}
