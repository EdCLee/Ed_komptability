let list:[Int] = [1,2,3,4,34,1333]

// list:[Int]의 인덱스가 0~5까지 존재하기때문에 애러 발생
//for i in 0..< 10 {
// 한단계 발전
//for i in 0..< list.count {

// 최종단계. 가장 일반적으로 많이 사용하는 문법
for i in list {

    // 간소화 하면서 i만 프린트하면 됨.
    //    print(list[i])
    print(i)
}