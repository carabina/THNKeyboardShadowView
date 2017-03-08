###Description
---
> THNKeyboardShadowView在弹出键盘时只允许编辑第一响应者视图，触控任何别的区域，键盘将收起。
> 


```
1. 编辑UITextView/UITextField弹出键盘时，会在键盘下方增加一个透明遮罩，点击遮罩，可让键盘收起
2. 如果点击的遮罩下方是正在编辑的UITextView/UITextField，则键盘不收起（如果点击另一个UITextView/UITextField，键盘收齐）。不影响UITextView/UITextField的复制、粘贴功能
3. 支持界面由多个window组成的应用
4. 不需注入任何代码，Podfile中引入即可使用
```

###Installation
---
```
$ pod 'THNKeyboardShadowView', '~> 1.0'
```

###License
---
```
THNKeyboardShadowView is released under the MIT license. See LICENSE for details.
```

