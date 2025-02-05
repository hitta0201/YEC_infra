$URL_auth = 'https://yaskawa-electric-corporation-4608.vmwareidentity.asia/auth/0'
$URL_connector = 'https://yaskawa-electric-corporation-4608.vmwareidentity.asia/ws1adminui/#/workspace/components/connectors/list'

$Driver = Start-SeDriver -Browser Chrome -StartURL $URL_auth

#$Searchbox = Get-SeElement -By Name -value q -Single
#Invoke-SeKeys -Element $Searchbox -Keys 'Powershell-Selenium'
#Invoke-SeKeys -Element $Searchbox -Keys ([OpenQA.Selenium.Keys]::Enter)

# ユーザー名入力
$loginid_area = Get-SeElement -By XPath -Value '//*[@id="username"]'
Invoke-SeKeys -Element $loginid_area -Keys 'aqua-operator'
# パスワード入力
$password_area = Get-SeElement -By XPath -Value '//*[@id="password"]'
Invoke-SeKeys -Element $password_area -Keys 'Dws@dmin1!'

# ログインボタンをクリック
$login_button = Get-SeElement -By XPath -Value '//*[@id="signIn"]'
Invoke-SeClick -Element $login_button

# コネクタ画面に遷移
Set-SeUrl $URL_connector

# 画面内の健全性情報の取得(取得までのタイムアウト5秒)
#$XPath_icon ='/html/body/wso-access-app/clr-main-container/wso-main-content/main/div/div/wso-connectors-list/div[2]/clr-datagrid/div[1]/div/div/div/div/div[2]/clr-dg-row[1]/div/div/div[2]/div/clr-dg-cell[4]/ul/li[1]/cds-icon'
#$icon_elm = Get-SeElement -By XPath -Value $XPath_icon -Timeout 5

$icon_elms = Get-SeElement -By Id -Value 'success_icon' -Timeout 10
#$icon_elms | Format-List

foreach ($icon_elm in $icon_elms) {
    $icon_status_value = Get-SeElementAttribute -Element $icon_elm -Name 'status'

    Write-Output $icon_status_value
}
Stop-SeDriver $Driver


#$XPath_icon ='/html/body/wso-access-app/clr-main-container/wso-main-content/main/div/div/wso-connectors-list/div[2]/clr-datagrid/div[1]/div/div/div/div/div[2]/clr-dg-row[1]/div/div/div[2]/div/clr-dg-cell[4]/ul/li[1]/cds-icon'
#$icon_elm = Get-SeElement -By XPath -Value $XPath_icon
#Get-SeElement -By XPath $XPath_icon | ?{$_.Text}

#$icon_status_value = Get-SeElementAttribute -Element $icon_elm -Attribute 'status'
#Write-Output $icon_status_value


#/html/body/wso-access-app/clr-main-container/wso-main-content/main/div/div/wso-connectors-list/div[2]/clr-datagrid/div[1]/div/div/div/div/div[2]/clr-dg-row[1]/div/div/div[2]/div/clr-dg-cell[4]/ul/li[1]/cds-icon
#/html/body/wso-access-app/clr-main-container/wso-main-content/main/div/div/wso-connectors-list/div[2]/clr-datagrid/div[1]/div/div/div/div/div[2]/clr-dg-row[1]/div/div/div[2]/div/clr-dg-cell[4]/ul/li[2]/cds-icon

#/html/body/wso-access-app/clr-main-container/wso-main-content/main/div/div/wso-connectors-list/div[2]/clr-datagrid/div[1]/div/div/div/div/div[2]/clr-dg-row[2]/div/div/div[2]/div/clr-dg-cell[4]/ul/li[1]/cds-icon