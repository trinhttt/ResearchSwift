//
//  DispatchWorkItemController.swift
//  Multithread
//
//  Created by Thai Thi Tu Trinh on 10/5/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit
//Nguon: https://viblo.asia/p/ios-concurrency-phan-35-grand-central-dispatch-3Q75wgxJ5Wb
class DispatchWorkItemController: UIViewController {

    //Dispatch Work Item là một block code mà chúng ta có thể gửi (dispatch) chúng lên bất kì queue nào. Điều này có nghĩa là chúng có thể chạy trên global queue hoặc main queue.
    override func viewDidLoad() {
        super.viewDidLoad()
        let dwi = DispatchWorkItem{
            for i in 1...5{
                print("DWT\(i)")
            }
        }
        //dang goi tren main thread
        dwi.perform()// goi perform de su dung dwi

        //co the goi duoi background nhu sau:
        //goi vs cach1
        DispatchQueue.global().async {
            dwi.perform()
        }
        
        //goi vs cach2:
        DispatchQueue.global().async(execute: dwi)
        
        //Co the su dung dispatchqueueitem de break luong dang chay:
        var dwItem : DispatchWorkItem?
        dwItem = DispatchWorkItem{// khởi tạo
            for i in 1...5 {
                if (dwItem?.isCancelled)!{
                    break
                }
                sleep(1)// sẽ cho sleep trong vòng 1 giây và in ra thứ tự của Dispatch Work Item đang chạy
                print(i)
            }
        }
        
        DispatchQueue.global().async(execute: dwItem!)//submit Dispatch Work Item tren tới global queue
        
        DispatchQueue.global().async { //3) Sau 3s kể từ khi chương trình chạy, chúng ta sẽ dùng method cancel() để dừng dipatch work item
            sleep(3)
            dwItem?.cancel()
        }
        //===>Ket qua in ra: 1 2 3
        
        
        //Dispatch cung cho phep goi 1 task khac truoc 1 dwi bang notify
        
        let dwi2 = DispatchWorkItem{
            print("task1")
        }
        
        dwi2.notify(queue: DispatchQueue.main){
            print("task2")
        }
        
        DispatchQueue.global().async(execute: dwi2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}
