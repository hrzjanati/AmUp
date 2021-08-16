`Alert view in github :`
```
https://github.com/candostdagdeviren/CDAlertView#advanced-action-initialization

```
`Just HTTP:`
```
https://github.com/dduan/Just
```


`Toast alert view in github:`
```
https://github.com/damboscolo/SwiftToast
```
`tab bar controller in github`
```
https://github.com/afshin-hoseini/LimberTabbar.iOS
```

`keyboard move view to up when times open keyboard in github`
```
https://github.com/IdleHandsApps/IHKeyboardAvoiding
```


`simpel did selected row`
```
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath) as! containerTableViewCell
     let labelContent = cell.lableNameContainers.text
    
    if (indexPath.row == 0) {
        print("check sharge")
        customDataSource.tableList = ArUtil.tableListContact
    }
    tableRecharg.reloadData()
    tableRecharg.selectRow(at: indexPath, animated: true, scrollPosition: .none)


    if (labelContent == "رمز مدیر ۴") {
       print("erey tihng is ok")
    }
    
}
```
