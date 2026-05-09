# poultry

## 生成序列化代码

dart run build_runner build
dart run drift_dev make-migrations

## 打包

flutter build appbundle --release
flutter build apk --release

## 配置VPN代理

export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890


set http_proxy=http://127.0.0.1:7890
set https_proxy=http://127.0.0.1:7890

curl -I https://www.google.com

## 生成证书

keytool -genkey -v -keystore poultry.jks -keyalg RSA -keysize 2048 -validity 10000 -alias poultry

# 数据库设置版本

···
PRAGMA user_version = 2;
···

# 生成logo

dart run flutter_launcher_icons
