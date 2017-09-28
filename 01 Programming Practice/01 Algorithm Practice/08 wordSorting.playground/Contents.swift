//단어정렬
//시간제한 2초
//메모리제한 128MB
//제출 7,359
//정답 2,549
//맞은사람 1,839
//정답비율 35.974

//문제
// 알파벳 소문자로 이루어진 N개의 단어가 들어오면 아래와 같은 조건에 따라 정렬하는 프로그램을 작성하시오.
// 1. 길이가 짧은 것부터
// 2. 길이가 같으면 사전 순으로

var inputTextArray:Set = ["hesitate", "yours", "wont", "more", "wait", "no", "but", "it", "im", "i", "cannot"]

var sortedText = inputTextArray.sorted {
    (s1,s2) -> Bool in
    s1.characters.count < s2.characters.count
}


// 2번 해결 안됨.
// 문자열에서 추출해야 하는 경우에는 어떻게 풀어야 할지? -> guessing to use "unicodeScalor?"
