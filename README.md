# jpqlTest

# cascade
`@ManyToMany(cascade = CascadeType.ALL)` だと 参照元をremoveすると
一緒に参照先のエントリーも削除される。

`@ManyToMany` だけでcascadeの指定がなかったらどうなるか？
とりあえず動作しそう。

# transient

## field に --transient をつけた場合
DBのカラムもできないし、jspxの要素も用意されない。getter, setterもRooで自動作成されない。

## @Transient
field で普通に作成した後、 `@Transaction` をつけた場合。
DBのカラムはできないが、jspxの要素は作成される。コントローラーまでは値が渡るが、永続化されない。

## DBのカラムは欲しいけど、画面上に表示したくない。
普通に作って、jspxで `render="false"` を付ける。

```xml
<field:input field="noTran" id="c_example_domain_WorkingModel_noTran" render="false" z="user_modified"/>
```