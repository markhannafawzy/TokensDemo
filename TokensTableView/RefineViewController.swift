//
//  RefineViewController.swift
//  
//
//  Created by HHasaneen on 2/14/19.
//

import UIKit
enum RefineRowLabel:String{
    case Speciality
    case Treatement
    case Disease
    case Symptoms
    case Insurance="Insurance Companies"
}
class RefineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var refineTableView: UITableView!
    var refineLabelDictionary = [Int:RefineRowLabel]()
    var refineTagsCriteriaDictionary = [RefineRowLabel:[String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refineTableView.rowHeight = 80
        refineTableView.register(UINib(nibName: "TokenTableViewCell", bundle: nil), forCellReuseIdentifier: "TokenTableViewCell")
        refineTableView.dataSource = self
        refineTableView.delegate = self
        refineLabelDictionary[0] = RefineRowLabel.Speciality
        refineLabelDictionary[1] = RefineRowLabel.Treatement
        refineLabelDictionary[2] = RefineRowLabel.Disease
        refineLabelDictionary[3] = RefineRowLabel.Symptoms
        refineLabelDictionary[4] = RefineRowLabel.Insurance
        
        var specialities:[String] = []
        specialities.append("internal medicine")
        specialities.append("general pediatric")
        specialities.append("pediatric cardiology")
        specialities.append("Cardiology")
        specialities.append("senior consultant")
        specialities.append("Ophthalmologist")

        refineTagsCriteriaDictionary[RefineRowLabel.Symptoms] = specialities

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refineLabelDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TokenTableViewCell", for: indexPath) as! TokenTableViewCell
        cell.criteriaLabel.text = refineLabelDictionary[indexPath.row]?.rawValue
        if let tagsList = refineTagsCriteriaDictionary[refineLabelDictionary[indexPath.row]!]{
            cell.taglistCollection.appendTag(tagNamelist: tagsList)
        }
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let criteria = refineLabelDictionary[indexPath.row]
        if let _ = refineTagsCriteriaDictionary[criteria!]{
            return 100
        }
        return  UITableView.automaticDimension
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RefineViewController : TokencellDelegate{
    func buttonClicked() {
        let specialityVC = self.storyboard?.instantiateViewController(withIdentifier: "CriteriaTableViewController") as! CriteriaTableViewController
        specialityVC.viewModel = CriteriaViewModel(criteria: refineTagsCriteriaDictionary)
        self.navigationController?.pushViewController(specialityVC, animated: true)
    }
}
