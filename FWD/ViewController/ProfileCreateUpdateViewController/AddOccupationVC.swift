//
//  AddEducationVC.swift
//  FWD
//
//  Created by 360 technosoft on 3/22/21.
//

import UIKit

class AddOccupationVC: UIViewController{
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var viewTblFooter: UIView!
    @IBOutlet weak var tblView: UITableView!
    
    // MARK: - Variable Declaration
    var arrOccupationHeader = ["Title" , "Company (or just industry)"]
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Custom Function
  
    
    
    // MARK: - Button Action Event
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnSkip(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "AddOccupationVC") as! AddOccupationVC
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    @IBAction func btnSubmit(_ sender: Any) {
    }
    
    
}
//MARK:- UITableview Delegate
extension AddOccupationVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
        
    }
    
}

// MARK:- TableView Datasource
extension AddOccupationVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tblView.separatorColor = UIColor.clear
        let displayDataCell = tableView.dequeueReusableCell(withIdentifier: "CreateProfileListTableViewCell", for: indexPath) as! CreateProfileListTableViewCell
        displayDataCell.selectionStyle = .none

        displayDataCell.lblHeader.text = arrOccupationHeader[indexPath.row]
        displayDataCell.viewTxtFooter.isShowNextArrowImage = false
        displayDataCell.viewTxtFooter.isUserInteractionEnabled = true
        return displayDataCell
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
        
    }
    
}

