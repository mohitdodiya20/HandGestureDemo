//
//  CreateProfileVC.swift
//  FWD
//
//  Created by 360 technosoft on 3/18/21.
//

import UIKit

class CreateProfileVC: UIViewController , UIGestureRecognizerDelegate , UITextFieldDelegate  , UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var btnCancelProfilePicture: UIButton!
    @IBOutlet weak var btnAddProfilePicture: UIButton!
    @IBOutlet weak var imgBackGroundBlur: UIImageView!
    @IBOutlet weak var constHeightUploadPhotos: NSLayoutConstraint!
    @IBOutlet weak var constHeightClctnView: NSLayoutConstraint!
    @IBOutlet weak var sgmentGender: WMSegment!
    @IBOutlet weak var heightTblView: NSLayoutConstraint!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var clctnViewAddPhoto: UICollectionView!
    @IBOutlet weak var viewDOB: CreateProfileTextFieldView!
    @IBOutlet weak var viewAreaLiveIn: CreateProfileTextFieldView!
    @IBOutlet weak var viewLastName: CreateProfileTextFieldView!
    @IBOutlet weak var viewFirstName: CreateProfileTextFieldView!
    
    @IBOutlet weak var imgProfilePicture: UIImageView!
    // MARK: - Variable Declaration
    var isFromUploadMorePhotos = false
    var imagePicker = UIImagePickerController()
    var selectedImage : UIImage?
  //  var imgProfilePicture: UIImageView!
    
    var arrAddPhotos = [0]
    
    var arrTblProfileList = ["Occupation" , "Education" , "Astrological Sign" , "Caste" , "Children" , "Religion" , "Smoking" , "What are you looking for?" , "Instagram"]
    
    var arrTblProfileListPlacehHolder = ["What is your job or profession?" , "What's your education?" , "What is your zodiac sign?" , "What is your caste?" , "What are you plans for children? " , "What is your religion?" , "Do you smoke? " , "Don't know yet" , "Link your Instagram"]
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionViewCell()
        setTblViewCell()
        setNextArrowHide()
        print("Test data")
        print("Changes test data 12345")
        //Set icon for location
        viewAreaLiveIn.isShowNextArrowImage = true
        viewAreaLiveIn.constWidthNextImage.constant = 20//25
        viewAreaLiveIn.btnNext.image = UIImage(named: "Location-1")
        
        print("Test data")
        print("test data two")
        //selected Segement color 
        sgmentGender.selectorColor = UIColor(patternImage: UIImage(named: "genderselection")!)
        
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        // Do any additional setup after loading the view.
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return (otherGestureRecognizer is UIScreenEdgePanGestureRecognizer)
    }
    
    
    //MARK:- Open Gallery and Camera
    
    func alertChooseImage()
    {
        let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertAction.Style.default)
        {
            UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertAction.Style.default)
        {
            UIAlertAction in
            self.openGallary()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
        {
            UIAlertAction in
            self.imgBackGroundBlur.isHidden = true
        }
        
        // Add the actions
        imagePicker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            self .present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alertWarning = UIAlertView(title:"Warning", message: "You don't have camera", delegate:nil, cancelButtonTitle:"OK", otherButtonTitles:"")
            alertWarning.show()
        }
    }
    func openGallary()
    {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    //MARK:- Image Picker Delegates
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.imgBackGroundBlur.isHidden = true
        self.btnAddProfilePicture.isHidden = true
        self.btnCancelProfilePicture.isHidden = false
        guard (info[.originalImage] as? UIImage) != nil else {
            print("Error: \(info)")
            return
        }
        if isFromUploadMorePhotos == true{
            isFromUploadMorePhotos = false
            arrAddPhotos.append(0)
        }else{
            self.selectedImage = info[.originalImage] as? UIImage
            self.imgProfilePicture.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        }
       
       
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        self.imgBackGroundBlur.isHidden = true
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:- Custom Function
    
    func setTblViewCell(){
        self.tblView.reloadData()
        tblView.register(UINib(nibName: "CreateProfileListTableViewCell", bundle: nil), forCellReuseIdentifier: "CreateProfileListTableViewCell")
        self.heightTblView.constant = CGFloat(arrTblProfileList.count * 98)
        
    }
    func setCollectionViewCell(){
        self.clctnViewAddPhoto.register(UINib.init(nibName: "AddPhotoCell", bundle: nil), forCellWithReuseIdentifier: "AddPhotoCell")
        
    }
    
    func setNextArrowHide(){
        viewFirstName.isShowNextArrowImage = false
        viewDOB.isShowNextArrowImage = false
        viewLastName.isShowNextArrowImage = false
        viewAreaLiveIn.isShowNextArrowImage = false
        
    }
    
    
    // MARK: - Button Action Event
    
    @IBAction func btnActionCancelProfilePicture(_ sender: Any) {
        self.imgBackGroundBlur.isHidden = true
        self.btnAddProfilePicture.isHidden = false
        self.btnCancelProfilePicture.isHidden = true
        self.imgProfilePicture.image = nil
    }
    @IBAction func btnActionAddProfilePicture(_ sender: Any)
    {
        self.imgBackGroundBlur.isHidden = false
        alertChooseImage()
        
    }
    @IBAction func bntActionInfo(_ sender: Any) {
        
    }
    @IBAction func btnActionAreaLiveIn(_ sender: Any) {
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "AreaMapVC") as! AreaMapVC
        self.definesPresentationContext = true
        obj.modalPresentationStyle = .overCurrentContext
        self.present(obj, animated: true, completion: nil)
        
    }
    
    
    
}
// MARK:- CollectionView Datasource
extension CreateProfileVC : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return   arrAddPhotos.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddPhotoCell", for: indexPath as IndexPath) as! AddPhotoCell
        
        
        return cell
    }
    
}
// MARK:- CollectionView Delegate

extension CreateProfileVC : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 5
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == arrAddPhotos.count - 1{
            isFromUploadMorePhotos = true
            self.imgBackGroundBlur.isHidden = false
            alertChooseImage()
           // arrAddPhotos.append(0)
        }else{
            
            arrAddPhotos.removeAll()
            for data in 0..<indexPath.row + 1{
                arrAddPhotos.append(data)
            }
            
        }
        
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        self.clctnViewAddPhoto.reloadData()
        
        //        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        DispatchQueue.main.asyncAfter(deadline: .now() ) {
            self.constHeightClctnView.constant =   self.clctnViewAddPhoto.contentSize.height  + 20
            self.constHeightUploadPhotos.constant =    self.constHeightClctnView.constant  + 14 + 20
            
        }
        
        
        return CGSize(width: 95, height: 121)
    }
    
    
    
}


//MARK:- UITableview Delegate
extension CreateProfileVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "AddOccupationVC") as! AddOccupationVC
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 1:
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "AddEducationVC") as! AddEducationVC
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 2 :
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "AstrologicalSignVC") as! AstrologicalSignVC
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 3 :
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CasteVC") as! CasteVC
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 4 :
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChildrenCountVC") as! ChildrenCountVC
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 5 :
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ReligionVC") as! ReligionVC
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 6 :
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SmokeVC") as! SmokeVC
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 7 :
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "FWDDateVC") as! FWDDateVC
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 8 :
            let instagramUrl = URL(string: "instagram://app")
            UIApplication.shared.canOpenURL(instagramUrl!)
            UIApplication.shared.open(instagramUrl!, options: [:], completionHandler: nil)
            
        default:
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "AddOccupationVC") as! AddOccupationVC
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
    }
    
}

// MARK:- TableView Datasource
extension CreateProfileVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tblView.separatorColor = UIColor.clear
        let displayDataCell = tableView.dequeueReusableCell(withIdentifier: "CreateProfileListTableViewCell", for: indexPath) as! CreateProfileListTableViewCell
        displayDataCell.selectionStyle = .none
        displayDataCell.lblHeader.text = arrTblProfileList[indexPath.row]
        displayDataCell.viewTxtFooter.isShowNextArrowImage = true
        displayDataCell.viewTxtFooter.textField.placeholder = arrTblProfileListPlacehHolder[indexPath.row]
        
        switch indexPath.row {
        case 8:
            displayDataCell.viewTxtFooter.isShowFronImage = true
        default:
            displayDataCell.viewTxtFooter.isShowFronImage = false
        }
        return displayDataCell
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTblProfileList.count
        
    }
    
}

