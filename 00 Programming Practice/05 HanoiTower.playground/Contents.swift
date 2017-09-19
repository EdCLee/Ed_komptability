//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 원판이 1개면 출발지 -> 목적지
// 원판이 1개가 아닌 경우.
// n-1개의 원판을 출발지에서 목적지를 거쳐 경유지로
// n 번을 출발지에서 목적지로
// n-1개를 경유지에서 출발지를 거쳐 목적지로
var count:Int = 0

func hanoiTower(diskCount:Int, pegA:String, pegB:String, pegC:String) {
    
    // 1개면 출발지에서 목적지로
    if diskCount == 1 {
        print("Move disk \(diskCount) from \(pegA) to \(pegC)")
    }else if diskCount != 1 {
        // 디스크 갯수가 1이 아닌경우 재귀함수를 이용해 재호출 후 디스크 갯수 -1을 수행하고
        // parameter 값을 다른 변수 자리에 binding 해줌으로써 loop가 가능해진다.
        hanoiTower(diskCount: diskCount - 1, pegA: pegA, pegB: pegC, pegC: pegB)
        print("Move disk \(diskCount) from \(pegA) to \(pegC)")
        hanoiTower(diskCount: diskCount - 1, pegA: pegB, pegB: pegA, pegC: pegC)
    }
    count += 1
}
// peg의 위치를 바꾼다고 생각하고 접근하면 조금 더 쉽게 풀 수 있다.
// peg를 움직인다는 생각이 결국 재귀함수와 연결이 된다.

hanoiTower(diskCount: 3, pegA: "A", pegB: "B", pegC: "C")
print("\(count)번 meditation을 수행 했다냥")
