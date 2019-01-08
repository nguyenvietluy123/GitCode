//
//  ViewController.swift
//  TakePhotoWithCamera
//
//  Created by Luy Nguyen on 8/22/18.
//  Copyright © 2018 Luy Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imagePicked: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }

    @IBAction func saveButton(_ sender: Any) {
        if let imageRepresentation = imagePicked.image {
            let imageData = UIImageJPEGRepresentation(imageRepresentation, 1)
            let imageToSave = UIImage(data: imageData!)
            UIImageWriteToSavedPhotosAlbum(imageToSave!, nil, nil, nil)
        }
        
        let alert = UIAlertController(title: "Saved", message: "Congratulation! Your photo was saved in library", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func openCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func openPhotoLibrary(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imagePicked.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}












