# Swift-versionCompare
判断 版本号是否有效 并返回结果


```swift
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

/*
v1 > v2 -> 1
v1 == v2  -> 0
v1 < v2 -> -1
v1 或者 v2 版本号字符 中有出现其他字符为 2
*/
fileprivate func versionCompare(_ v1:String,_ v2:String) -> Int { ... }


print("\n\n正确的数据的结果")
print("\(versionCompare(vsersion1, vsersion1))")  //结果为:0
print("\(versionCompare(vsersion1, vsersion2))")  //结果为:1
print("\(versionCompare(vsersion2, vsersion3))")  //结果为:-1
print("\(versionCompare(vsersion1, vsersion3))")  //结果为:1

print("\n\n这个看需求吧")
print("\(versionCompare(vsersion1, vsersion4))")  //结果为:-1

print("\n\n异常的")
print("\(versionCompare(vsersion1, vsersion10))")  //结果为:2
print("\(versionCompare(vsersion1, vsersion11))")  //结果为:2
print("\(versionCompare(vsersion1, vsersion12))")  //结果为:2
print("\(versionCompare(vsersion1, vsersion13))")  //结果为:2
print("\(versionCompare(vsersion1, vsersion14))")  //结果为:2
print("\(versionCompare(vsersion1, vsersion15))")  //结果为:2
````
