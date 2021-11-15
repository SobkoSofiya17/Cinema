
import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var image:UIImage?
    @Binding var imageName:String
    @Binding var isPresented: Bool
    
    func makeCoordinator() -> ImagePickerViewCoordinator {
        return ImagePickerViewCoordinator(isPresented: $isPresented, image: $image, imageName: $imageName)
        }
 
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
           let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
           pickerController.delegate = context.coordinator
           return pickerController
       }

       func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
       }
}


class ImagePickerViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var isPresented: Bool
    @Binding var image:UIImage?
    @Binding var imageName:String
  
    init(isPresented: Binding<Bool>, image:Binding<UIImage?>, imageName:Binding<String>) {
        self._isPresented = isPresented
        _image = image
        _imageName = imageName
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let nameImage = "\(UUID().uuidString).png"
            
//            let dateFormatter = DateFormatter()
//            dateFormatter.timeStyle = DateFormatter.Style.short
            
            self.image = image
            self.imageName = nameImage
            UserDefaults.standard.set(imageName, forKey: "imageName")
            Helper().saveImageToDocumentDirectory(image: image, name: nameImage)
        }
        self.isPresented = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.isPresented = false
    }
    
}
class Helper {
    func saveImageToDocumentDirectory(image: UIImage, name: String ) {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileName = name
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        if let data = image.jpegData(compressionQuality: 1.0),!FileManager.default.fileExists(atPath: fileURL.path){
            do {
                try data.write(to: fileURL)
            } catch {
                print("error saving file:", error)
            }
        }
    }


    func loadImageFromDocumentDirectory(nameOfImage : String) -> UIImage {
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        if let dirPath = paths.first{
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(nameOfImage)
            let image    = UIImage(contentsOfFile: imageURL.path)
            return image!
        }
        return UIImage.init(named: "35")!
    }
}
