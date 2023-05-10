//
//  main.swift
//  BaekJoon#2468
//
//  Created by 김병엽 on 2023/04/27.
//
// Reference: https://seolhee2750.tistory.com/134

import Foundation

let n = Int(readLine()!)!
var area = [[Int]]()
var height = [Int]()

for _ in 0..<n {
    area.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    for i in 0..<n {
        if !height.contains(area[area.count - 1][i]) {
            height.append(area[area.count - 1][i])
        }
    }
}

height.sort(by: <)

var count = 0
var max = 0
let area_fix = area

func bfs(_ x: Int, _ y: Int, _ now_h: Int) {

    // 예외
    if x < 0 || y < 0 || x >= n || y >= n || area[x][y] <= now_h { return }

    // 방문한 지역을 기준 높이로 지정
    area[x][y] = now_h

    // 재귀 호출
    bfs(x + 1, y, now_h)
    bfs(x - 1, y, now_h)
    bfs(x, y + 1, now_h)
    bfs(x, y - 1, now_h)
}

for i in height {

    let h = i

    for x in 0..<n {
        for y in 0..<n {
            if area[x][y] > h {
                count += 1
                bfs(x, y, h)
            }
        }
    }

    if max < count { max = count }
    count = 0
    area = area_fix
}

print(max)
