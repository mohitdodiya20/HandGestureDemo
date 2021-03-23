//
//  ChildrenCountVC.swift
//  FWD
//
//  Created by 360 technosoft on 3/23/21.
//

import UIKit

class ChildrenCountVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var constHeightTblView: NSLayoutConstraint!
    
    // MARK: - Variable Declaration
    
    var selectedIndexPath = 0

    var arrChildrenText = ["Don't want" , "Have + want" , "Have + don't want more" , "Want someday"]
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    //MARK:- Custom Function
    
    func setTblViewCell(){
        self.constHeightTblView.constant = CGFloat(arrChildrenText.count * 64)
    }
    
    
    // MARK: - Button Action Event
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSkipThisStep(_ sender: Any) {
    }
    
    
    
    
    
    
}
// MARK:- TableView Datasource
extension ChildrenCountVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tblView.separatorColor = UIColor.clear

        let displayDataCell = tableView.dequeueReusableCell(withIdentifier: "AddEducationTableViewCell", for: indexPath) as! AddEducationTableViewCell
        displayDataCell.selectionStyle = .none
        displayDataCell.viewTxtFooter.isShowNextArrowImage = false
        displayDataCell.viewTxtFooter.textField.text = arrChildrenText[indexPath.row]
        displayDataCell.viewTxtFooter.textField.isUserInteractionEnabled = false
        if selectedIndexPath == indexPath.row{
            displayDataCell.viewTxtFooter.isSelectedView = true
        }else{
            displayDataCell.viewTxtFooter.isSelectedView = false
        }
        
        return displayDataCell
        
    }
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrChildrenText.count
        
    }
    
}

//MARK:- UITableview Delegate
extension ChildrenCountVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath.row
        
        self.tblView.reloadData()
    }
    
    
}
