# Offline Downloads
## 通过GitHub action 实现了一些没有离线下载功能的云盘支持离线下载😂😂
### 支持云盘
阿里云盘
OneDrive 国际版
### 支持的下载类型
普通链接 磁力链接 以及种子 哔哩哔哩下载
#### OneDrive 国际版 Token获取方法
在浏览器打开 [Onedrive 登陆链接](https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id=78d4dc35-7e46-42c6-9023-2d39314433a5&response_type=code&redirect_uri=http://localhost/onedrive-login&response_mode=query&scope=offline_access%20User.Read%20Files.ReadWrite.All) 并登录
在浏览器地址栏中获取以 
将获取的完整url内容替换命令中的 url 三个字母
每次产生的 url 只能用一次, 重试请重新获取 url
获取http://loaclhost 开头的整个url内容后 在终端输入./OneDriveUploader -a 你获取的url
请自行将获取自动生成的auth.json上传至OnedriveCli目录后可直接在action填入信息使用
## 限制
文件不可超过20G，种子可分段下
## 功能实现的贡献
[@tickstep](https://github.com/tickstep/aliyunpan)
、
[@MoeClub](https://github.com/MoeClub/OneList)
