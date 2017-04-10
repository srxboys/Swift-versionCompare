//
//  ViewController.swift
//  Swift-VersionCompare
//
//  Created by srx on 2017/4/10.
//  Copyright © 2017年 https://github.com/srxboys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        printCompare()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController {
    fileprivate func printCompare() {
        //测试数据
        let vsersion1 = "2.0.1.0.1"
        let vsersion2 = "1.3.5.0.9.8"
        let vsersion3 = "1.4.0"
        let vsersion4 = "2.00.10"
        
        //错误数据
        let vsersion10 = "1..."
        let vsersion11 = "100.100.sdf"
        let vsersion12 = "100.10*.1"
        let vsersion13 = ""
        let vsersion14 = " "
        let vsersion15 = "1. .1"

        
        print("\n\n正确的数据的结果")
        print("\(versionCompare(vsersion1, vsersion1))")
        print("\(versionCompare(vsersion1, vsersion2))")
        print("\(versionCompare(vsersion2, vsersion3))")
        print("\(versionCompare(vsersion1, vsersion3))")
        
        print("\n\n这个看需求吧")
        print("\(versionCompare(vsersion1, vsersion4))")

        print("\n\n异常的")
        print("\(versionCompare(vsersion1, vsersion10))")
        print("\(versionCompare(vsersion1, vsersion11))")
        print("\(versionCompare(vsersion1, vsersion12))")
        print("\(versionCompare(vsersion1, vsersion13))")
        print("\(versionCompare(vsersion1, vsersion14))")
        print("\(versionCompare(vsersion1, vsersion15))")
        
        
    }
    
    
    /*
     v1 > v2 -> 1
     v1 == v2  -> 0
     v1 < v2 -> -1
     v1 或者 v2 版本号字符 中有出现其他字符为 2
     */
   fileprivate func versionCompare(_ v1:String,_ v2:String) -> Int {
        let vv1 = v1.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        let vv2 = v2.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        
        //处理异常
        if(vv1.isEmpty || vv2.isEmpty) {
            return 2
        }
        
        var noShow = false
        for char in vv1.characters {
            if((char < "0" || char > "9") && char != ".") {
                return 2
            }
                //以下是处理 版本都是....
            else if(char == ".") {
                if(noShow) {
                    return 2
                }
                noShow = true
            }
            else {
                noShow = false
            }
        }
        
        
        
        noShow = false
        for char in vv2.characters {
            if((char < "0" || char > "9") && char != ".") {
                return 2
            }
                //以下是处理 版本都是....
            else if(char == ".") {
                if(noShow) {
                    return 2
                }
                noShow = true
            }
            else {
                noShow = false
            }
        }
    
        //第一种用系统的方法
//        return vv1.compare(vv2).rawValue
    
        //第二种，手动处理
    
        let v1Arr = vv1.components(separatedBy: ".")
        let v2Arr = vv2.components(separatedBy: ".")
        
        var index : Int = 0
        
        let count : Int = v1Arr.count > v2Arr.count ? v2Arr.count : v1Arr.count
        
        for i in 0 ..< count{
            //此处字符串 不用再次处理了，上面的处理过了
            let v1Str = v1Arr[i]
            let v2Str = v2Arr[i]
            
            let v1Int = Int(v1Str as String)!
            let v2Int = Int(v2Str as String)!
            
            if(v1Int > v2Int) {
                return 1
            }
            else if(v1Int < v2Int) {
                return -1
            }
            index = i
        }
        
        //如果 v1 ==v4   或者 v5==v6  下面的话插入 if分支中
        //index 后序的 字符 是 0，就返回1
        
        index += 1
        if(index > v1Arr.count && index == v2Arr.count) {
            return -1
        }
        else if(index < v1Arr.count && index == v2Arr.count) {
            return 1
        }
        else if(index == v1Arr.count && index < v2Arr.count) {
            return -1
        }
        else {
            return 0
        }
    
    }
}

