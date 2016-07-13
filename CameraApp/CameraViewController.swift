//
//  CameraViewController.swift
//  CameraApp
//
//  Created by Bryan Ayllon on 7/13/16.
//  Copyright © 2016 Bryan Ayllon. All rights reserved.
//

import UIKit
import CoreImage

class CameraViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoView: UIImageView!
    var originalImage :UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cameraButtonWasPressed(){
        let imagePickerViewController =  UIImagePickerController()
        imagePickerViewController.delegate = self
        
        let alertController = UIAlertController(title: "Choose", message: nil, preferredStyle: .ActionSheet)
        
        let chooseFromLibraryOption = UIAlertAction(title: "Choose from Library", style: .Default) { (alert :UIAlertAction) in
            
            imagePickerViewController.sourceType = .PhotoLibrary
            self.presentViewController(imagePickerViewController, animated: true, completion: nil)
}
  let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (alert :UIAlertAction) in
        

    
        }
        
        let takePictureAction = UIAlertAction(title: "Take a picture", style: .Default) { (alert :UIAlertAction) in
            
            imagePickerViewController.sourceType = .Camera
            self.presentViewController(imagePickerViewController, animated: true, completion: nil)
            
        }
        
        alertController.addAction(chooseFromLibraryOption)

        alertController.addAction(takePictureAction)

        alertController.addAction(cancel)

        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
  
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        self.originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.photoView.image = self.originalImage
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func saveButtonPressed(){
        
        UIImageWriteToSavedPhotosAlbum(originalImage, self, nil, nil)
        
    }
    
    
    
    
    
}
