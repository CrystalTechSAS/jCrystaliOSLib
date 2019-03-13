/*
 * The MIT License
 *
 * Copyright (c) 2018-2019 German Augusto Sotelo Arevalo
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
import UIKit
class PhotoPicker : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var controller : UIViewController?
    var imageRecieve : ((UIImage)->())?
    func take(_ controller : UIViewController, imageRecieve : @escaping (UIImage)->()){
        self.imageRecieve = imageRecieve
        self.controller = controller
        let imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        controller.present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let uiImage = info[.originalImage] as? UIImage{
            let scaleFactor = max(600.0 / uiImage.size.width, 600.0 / uiImage.size.height )
            let newSize = CGSize(width: uiImage.size.width*scaleFactor, height: uiImage.size.height*scaleFactor)
            imageRecieve?(scaledToSizeWithImage(imag: uiImage, newSize: newSize))
        }
        
    }
}
func scaledToSizeWithImage(imag : UIImage, newSize: CGSize)->UIImage{
    UIGraphicsBeginImageContext(newSize);
    imag.draw(in: CGRect(x:0, y:0, width: newSize.width, height : newSize.height))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage!
}
