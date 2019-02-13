//
//  TokensTableViewController.swift
//  TokensTableView
//
//  Created by msaad on 2/11/19.
//  Copyright © 2019 msaad. All rights reserved.
//

import UIKit
class TokensTableViewController: UITableViewController {
    var dataProviders: [ZFTokenFieldDataProvider] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 30
        self.createDataProvidersForFields(numberOfProviders: 7)
    }
    
    func createDataProvidersForFields(numberOfProviders: Int) {
        for i in 0..<numberOfProviders {
            let dataprovider = ZFTokenFieldDataProvider {
                self.tableView.beginUpdates()
                self.tableView.endUpdates()
            }
            dataProviders.append(dataprovider)
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TokensTableViewCell
        // Configure the cell...

        cell.tokenField.delegate = dataProviders[indexPath.row]
        cell.tokenField.dataSource = dataProviders[indexPath.row]

        cell.tokenField.textField.placeholder = "enter something"
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
