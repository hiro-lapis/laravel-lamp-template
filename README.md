# laravel-lamp-template

アプリケーションサーバーとDBの2階層アプリケーション構成  
参考にさせていただいたサイト: [Laravel + Docker + LAMP な環境を作成](https://mossa.dev/post/laravel_docker_lamp/)

### 準備① 
docker-compose.ymlのDB項目(environment)をアプリに合わせて編集、このシェルと同じ階層に置いておくこと
### 準備② 
このシェルのmy-siteの部分をアプリ名にリネーム
### 準備③ 
docker-compose.ymlのmysqlのバージョンを任意に編集
### 準備④ 
DockerfileのPHPバージョンを任意に編集

### 実行
ディレクトリ内で `sh startup.sh` と打つだけ!
