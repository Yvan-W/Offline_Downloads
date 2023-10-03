# Offline Downloads
## 通过GitHub action 实现了一些没有离线下载功能的云盘支持离线下载😂😂
### 支持云盘
阿里云盘
OneDrive 国际版
### 支持的下载类型
普通链接 磁力链接 以及种子 哔哩哔哩下载
### 使用方法
#### 对于阿里云盘
请在 Secrets and variables 中的Action 中填写阿里云盘的token
名称为：ALIYUNTOKEN
如图
![屏幕截图 2023-10-04 071659](https://github.com/Yvan-W/Offline_Downloads/assets/80970174/fab78292-de4c-4aa4-a483-8417ee59006c)
#### 对于OneDrive 国际版
#####  Token获取方法
在浏览器打开 [Onedrive 登陆链接](https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id=78d4dc35-7e46-42c6-9023-2d39314433a5&response_type=code&redirect_uri=http://localhost/onedrive-login&response_mode=query&scope=offline_access%20User.Read%20Files.ReadWrite.All) 并登录
在浏览器地址栏中获取以 http://loaclhost 开头的整个url内容
获取http://loaclhost 开头的整个url内容后 在终端输入 ./OneDriveUploader -a 你获取的url
请自行将获取自动生成的auth.json上传至OnedriveCli目录后可直接在action填入信息使用
#### 其他配置项
PAT
SMTP_PASSWORD
SMTP_PORT
SMTP_SERVER
SMTP_USERNAME
TO_EMAIL
![image](https://github.com/Yvan-W/Offline_Downloads/assets/80970174/11a6c2b0-2803-4185-bd5b-01ff1aa4767a)
## 限制
文件不可超过46G，种子可分段下
## 说明
### 为什么会存在这个项目？
#### 通过这个项目可以实现阿里云盘和Onedrive 没有离线下载功能的遗憾
### 为什么要实现阿里云盘和Onedrive 离线下载功能
#### 像我这种影视爱好者，观看影视作品时对画质是有一定要求，所以会选择下载画质较高的资源来进行观看，而不是在线网站看，通过这个项目，便省去了下载时对硬盘的空间的要求和大文件读写对硬盘的磨损，而且可以直接将喜欢的影视作品收藏至云盘，省去了先下载再上传的时间和宽带资源
### 将文件直接放在阿里云盘或者OneDrive就能不下载直接观看了吗？
#### 是的，通过alist 将阿里云盘等云盘挂载在本地便可源文件在线看高清电影
### 难道就只是一个下载片的项目吗？
#### 不不不，由于GitHub是国外的，所以你懂的，一些需要翻墙下载的大文件相信大家都被下载时间折磨过吧，通过此项目便可解决，将文件离线下载到阿里云盘，后通过阿里云盘下载，很快，阿里云盘是不限速的
### 请问如何使用alist
#### 自行百度
## 功能实现的贡献
[@tickstep](https://github.com/tickstep/aliyunpan)
、
[@MoeClub](https://github.com/MoeClub/OneList)
