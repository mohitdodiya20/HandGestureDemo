//
//  CasteVC.swift
//  FWD
//
//  Created by 360 technosoft on 3/23/21.
//

import UIKit

class CasteVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var constHeightTblView: NSLayoutConstraint!
    
    // MARK: - Variable Declaration
    
<<<<<<< HEAD
    var arrCastText = ["Adi Dravida" , "Agarwal" , "Arya Vysya" , "Brahmin" , "Ezhava" , "Jain" ,"Adi Dravida" , "Agarwal" , "Arya Vysya" , "Brahmin" , "Ezhava" , "Adi Dravida" , "Agarwal" , "Arya Vysya" , "Brahmin" , "Ezhava"]
=======
    var arrCastText = ["Adi Dravida" , "Agarwal" , "Arya Vysya" , "Brahmin" , "Ezhava" , "Jain" ,"Adi Dravida" , "Agarwal" , "Arya Vysya" , "Brahmin" , "Ezhava" , "Adi Dravida" , "Agarwal" , "Arya Vysya" , "Brahmin" , "Ezhava", "Test"]
>>>>>>> V0.1/Profile-Setting
    var selectedIndexPath = 0

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTblViewCell()
        
<<<<<<< HEAD
        
=======
        print("Change")
>>>>>>> V0.1/Profile-Setting
        
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Custom Function
    
    func setTblViewCell(){
        self.constHeightTblView.constant = CGFloat(arrCastText.count * 64)
    }
    
    
    // MARK: - Button Action Event
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSkipThisStep(_ sender: Any) {
    }
    
    
    
    
    
    
}
// MARK:- TableView Datasource
extension CasteVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tblView.separatorColor = UIColor.clear

        let displayDataCell = tableView.dequeueReusableCell(withIdentifier: "AddEducationTableViewCell", for: indexPath) as! AddEducationTableViewCell
        
        displayDataCell.selectionStyle = .none

        displayDataCell.viewTxtFooter.textField.text = arrCastText[indexPath.row]
        displayDataCell.viewTxtFooter.isShowNextArrowImage = false
        if selectedIndexPath == indexPath.row{
            displayDataCell.viewTxtFooter.isSelectedView = true
        }else{
            displayDataCell.viewTxtFooter.isSelectedView = false
        }
        
       
        displayDataCell.viewTxtFooter.textField.isUserInteractionEnabled = false
        return displayDataCell
        
    }
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCastText.count
        
    }
    
}

//MARK:- UITableview Delegate
extension CasteVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath.row
        
        self.tblView.reloadData()
    }
    
    
}
