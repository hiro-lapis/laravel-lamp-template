# laravel-lamp-template

アプリケーションサーバーとDBの2階層アプリケーション構成  
参考にさせていただいたサイト: [Laravel + Docker + LAMP な環境を作成](https://mossa.dev/post/laravel_docker_lamp/)

### 準備① 
docker-compose.ymlのDB項目(environment)をアプリに合わせて編集、startup.shと同じ階層に置いておくこと
### 準備② 
startup.shファイル内のmy-siteの部分をアプリ名に編集
### 準備③ 
docker-compose.ymlのmysqlのバージョンを任意に編集
### 準備④ 
DockerfileのPHPバージョンを任意に編集

### 実行
ディレクトリ内で `sh startup.sh` と打つ  
シェル実行後、DBにマイグレーションを実行するまでの手順はシェルファイル内参照

### dockerコマンド  
#### Webサーバーコンテナへ入る
` docker exec -it my-site_web_1 bash`  

#### MySQLサーバー(rootユーザー)コンテナへ入る
`docker exec -it inspiration_mysql_1 bash -c 'mysql -u root -p'`  
パスワード入力を求められるので、`docker-compose.yml`内の`MYSQL_ROOT_PASSWORD`を入力
