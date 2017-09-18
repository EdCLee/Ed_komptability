![](/Users/CLEE/Documents/EdKomptability/quiver/0.imgsources/ChanghoCover.pdf)

<br>
<br>
<br>
`Assignments`
  - [과제페이지](https://github.com/EdCLee/Ed_komptability/tree/master/assignments)

`Projects`
  - [계산기](https://github.com/EdCLee/Ed_komptability/blob/master/projects/01%20Calculator/Calculator/ViewController.swift)
<br>
<br>
<br>
# Shortcuts & Tips

## macOS

우선! [macOS 단축키](https://support.apple.com/ko-kr/HT201236) 알기.
 
<kbd>⌘</kbd> : command key<br>
<kbd>⇧</kbd> : shift key<br>
<kbd>⌥</kbd> : option key<br>
<kbd>⌃</kbd> : control key<br>
<kbd>⇪</kbd> : caps lock<br>
<kbd>fn</kbd> : function key<br>

## Xcode
<kbd>⌘</kbd> + <kbd>N</kbd> : 새로 만들기.

<kbd>⌘</kbd> + <kbd>0</kbd> : Navigator 열기/닫기.

<kbd>⌘</kbd> + <kbd>⇧</kbd> + <kbd>0</kbd> : Navigator 열기/닫기

<kbd>⌘</kbd> + <kbd>⇧</kbd> + <kbd>down</kbd> or <kbd>up</kbd> 줄 선택.

<kbd>⌘</kbd> + <kbd>⇧</kbd> + <kbd>down</kbd> or <kbd>up</kbd> 부분 선택.

<kbd>⌘</kbd> + <kbd>⌥</kbd> + <kbd>[</kbd> or <kbd>]</kbd> : 선택한 줄 위 아래로 이동.

<kbd>⌘</kbd> + <kbd>⇧</kbd> + <kbd>O</kbd> : 정의서 보기. Definition Documents

<kbd>⌘</kbd> + `click` : 정의서 보기. Definition Documents

<kbd>⌥</kbd> + `click` : quick help.

- `///` 입력하면 quick help 에서 조회 가능한 주석 작성 가능.

- `// MARK: - 숫자` 버튼들와 같은 주석으로 코드의 흐름을 구분할 수 있다. ( Xcode의 경로표시줄에서 쉽게 이동이 가능하다. )

- UIButton.sender에서 `sender.titleLabel.text`를 통해 버튼의 텍스트 값을 받아올 수 있다.

```swift
@IBAction func numberBtnTouched(_ sender: UIButton) {
         print("\(sender.currentTitle!))번 버튼 누름.")
                  
         addDisplayNumber(num:(sender.titleLabel?.text)!)
         addFirstNumOrSecondNum(number:displayNumber)
         
         self.displayLabel.text = displayNumber
     }
```

## Linux
> 터미널에서 사용하게 될 용어

Under developing now.

```terminal
ls rm //컴퓨터 파괴!
```

---

지속적으로 업데이트 하겠음.

