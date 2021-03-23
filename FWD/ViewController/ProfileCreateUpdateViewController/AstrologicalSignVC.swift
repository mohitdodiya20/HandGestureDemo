//
//  AstrologicalSignVC.swift
//  FWD
//
//  Created by 360 technosoft on 3/23/21.
//

import UIKit

class AstrologicalSignVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var constHeightTblView: NSLayoutConstraint!
    // MARK: - Variable Declaration
    var selectedIndexPath = 0

     var arrAstrologyText = ["No preference" , "Aquarius" , "Pisces" , "Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius" , "Capricorn"]
    
   
    var arrAstrologyImages = ["" , "aquarius" , "pisces" , "aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagittarius" , "capricorn"]
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTblViewCell()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Custom Function
    
    func setTblViewCell(){
        self.constHeightTblView.constant = CGFloat(arrAstrologyText.count * 64)
    }
    
    
    // MARK: - Button Action Event
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSkipThisStep(_ sender: Any) {
    }
    
    
    
    
    
    
}
// MARK:- TableView Datasource
extension AstrologicalSignVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tblView.separatorColor = UIColor.clear

        let displayDataCell = tableView.dequeueReusableCell(withIdentifier: "AddEducationTableViewCell", for: indexPath) as! AddEducationTableViewCell
        
        displayDataCell.selectionStyle = .none

        displayDataCell.viewTxtFooter.textField.text = arrAstrologyText[indexPath.row]
        displayDataCell.viewTxtFooter.isShowNextArrowImage = false
        if selectedIndexPath == indexPath.row{
            displayDataCell.viewTxtFooter.isSelectedView = true
        }else{
            displayDataCell.viewTxtFooter.isSelectedView = false
        }
        
        
        
        switch indexPath.row {
        case 0:
            displayDataCell.viewTxtFooter.isShowFronImage = false
        default:
            displayDataCell.viewTxtFooter.isShowFronImage = true
            displayDataCell.viewTxtFooter.btnInstagram.image = UIImage(named: arrAstrologyImages[indexPath.row] )
        }
       
        displayDataCell.viewTxtFooter.textField.isUserInteractionEnabled = false
        return displayDataCell
        
    }
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAstrologyText.count
        
    }
    
}

//MARK:- UITableview Delegate
extension AstrologicalSignVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath.row
        
        self.tblView.reloadData()
    }
    
    
}
