//
//  ViewController.swift
//  OCR-Application
//
//  Created by Himanshu Churi on 7/29/20.
//  Copyright © 2020 Himanshu Churi. All rights reserved.
//

import UIKit
import Vision
import VisionKit


class MainCV: UIViewController {

    @IBOutlet weak var camView: camView!
    @IBOutlet weak var txtView: txtFld!
    @IBOutlet weak var scanBtn: okBtn!
    
    var ocrRequest = VNRecognizeTextRequest(completionHandler: nil)
    
    
    @objc private func scanDoc(){
        let scanVC = VNDocumentCameraViewController()
        scanVC.delegate = self
        present(scanVC, animated: true)
    }
    
    private func processImage(_ image: UIImage){
        guard let cImage = image.cgImage else {
            return
        }
        
        txtView.text = ""
        scanBtn.isEnabled = false
        
        let requestHandler = VNImageRequestHandler(cgImage: cImage, options: [: ])
        do {
            try requestHandler.perform([self.ocrRequest])
        } catch {
            print(error)
        }
    }
    
    private func configureOCR() {
        ocrRequest = VNRecognizeTextRequest{
            (request, error) in guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            
            var ocrText = ""
            for observation in observations {
                guard  let topCandidate = observation.topCandidates(1).first else { return }
                ocrText += topCandidate.string + "\n"
            }
            
            DispatchQueue.main.async {
                self.txtView.text = ocrText
                self.scanBtn.isEnabled = true
            }
        }
        
        ocrRequest.recognitionLevel = .accurate
        ocrRequest.recognitionLanguages = ["en-US", "en-GB"]
        ocrRequest.usesLanguageCorrection = true
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scanBtn.addTarget(self, action: #selector(scanDoc), for: .touchUpInside)
        configureOCR()
    }


}


extension MainCV: VNDocumentCameraViewControllerDelegate {
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        guard scan.pageCount >= 1 else {
            controller.dismiss(animated: true)
            return
        }
        
        camView.image = scan.imageOfPage(at: 0)
        processImage(scan.imageOfPage(at: 0))
        controller.dismiss(animated: true)
}
    func  documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true)
    }
}

