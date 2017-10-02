//
//  ViewController.swift
//  TinkoffChat
//
//  Created by Furycateur on 20.09.17.
//  Copyright © 2017 Fury. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var uploadPhotoIcon: UIButton!
    @IBOutlet weak var photoPlace: UIImageView!
    @IBOutlet weak var editProfileButton: UIButton!
    
    let photoPicker = UIImagePickerController()
  
    
    @IBAction func tapEditPhotoIcon(sender: UIButton!){
       print("Выбери изображение профиля")
        let userPictureActionSheet = UIAlertController(title: "Choose ur best Photo", message: nil, preferredStyle: .actionSheet)
        showListOfActions(userPictureActionSheet)
        present(userPictureActionSheet, animated: true)
    }
    
    
    
    
    func showListOfActions(_ sheet: UIAlertController) {
        sheet.addAction(UIAlertAction(title: "Take photo", style: .default) {
            [unowned self] action in
            
            if !UIImagePickerController.isSourceTypeAvailable(.camera){
                let alertController = UIAlertController.init(title: nil, message: "У симулятора камеры нет, лул 😭", preferredStyle: .alert)
                let okAction = UIAlertAction.init(title: "Понятненько", style: .default, handler: {(alert: UIAlertAction!) in
                })
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
                
            else{
            self.photoPicker.allowsEditing = false
            self.photoPicker.sourceType = UIImagePickerControllerSourceType.camera
            self.photoPicker.cameraCaptureMode = .photo
            self.photoPicker.modalPresentationStyle = .fullScreen
            self.present(self.photoPicker, animated: true)
            }
        })
        
        sheet.addAction(UIAlertAction(title: "Select from library", style: .default) {
            [unowned self] action in
            
            self.photoPicker.allowsEditing = false
            self.photoPicker.sourceType = .photoLibrary
            self.photoPicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.present(self.photoPicker, animated: true)
        })
        
        
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel) { action in })
    }
    
    

    
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : Any])
    {
        var  chosenImage = UIImage()
        chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoPlace.image = chosenImage
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ photoPicker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    

    // MARK : Lifecycle
    override func viewDidLoad() {
        
        let radiusOfIconCorners = uploadPhotoIcon.frame.size.width / 2
        uploadPhotoIcon.layer.cornerRadius = radiusOfIconCorners
        photoPlace.layer.cornerRadius = radiusOfIconCorners
        uploadPhotoIcon.clipsToBounds = true
        photoPlace.clipsToBounds = true

        
        editProfileButton.layer.borderWidth = 2
        editProfileButton.layer.cornerRadius = 8
        editProfileButton.layer.borderColor = UIColor.black.cgColor
        
        let frameForViewDidLoad = editProfileButton.frame
        print("Edit button frame \(frameForViewDidLoad) from viewDidLoad")
        
        super.viewDidLoad()
        photoPicker.delegate = self
    }

   
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let frameForViewWillAppear = self.editProfileButton.frame
        print("Edit button frame \(frameForViewWillAppear) viewWillAppear")
        print("Не отличается 🦄")
        //print(#function)  — 1st hw
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //print(#function)  — 1st hw
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       // print(#function)  — 1st hw
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //print(#function)  — 1st hw
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //print(#function)  — 1st hw
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //print(#function)  — 1st hw
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //print(#function)  — 1st hw
    }
    
    

    

    
 
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


