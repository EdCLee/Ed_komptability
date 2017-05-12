# Shortcuts
> 알면 편해지는 단축키 모음


우선! [macOS 단축키](https://support.apple.com/ko-kr/HT201236)를 숙지한다.
 


## Xcode

<kbd>command</kbd> + <kbd>shift</kbd> + <kbd>down</kbd> or <kbd>up</kbd> 줄 선택

<kbd>command</kbd> + <kbd>option</kbd> + <kbd>down</kbd> or <kbd>up</kbd> 부분 선택

## Linux
> 터미널에서 사용하게 될 용어


## tips

tag : 태그기능. 숫자만 입력이 가능하며 Controller에서 태그를 호출할 수 있다.

``` swift  
	// 계산기에서 버튼 0에 해당하는 함수이다.
    @IBAction func touch0(_ sender: UIButton) {
        print("0")
        displayOutlet.text = displayOutlet.text! + String(sender.tag-1)
    }
```
tag의 기본값은 0이며 프로그래밍에 있어 0은 오류를 발생 시킬 수 있는 숫자이므로 태그에 +1을 하였고, 함수에서 -1을 적용시켜 숫자 0 버튼을 눌렀을 시 0 값이 들어갈 수 있게 설정 하였다.

* 가능한한 사용하지 않는것을 추천. 