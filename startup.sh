# 参考にしたHP https://mossa.dev/post/laravel_docker_lamp/

# 事前準備① docker-compose.ymlのDB項目(environment)をアプリに合わせて編集、このシェルと同じ階層に置いておくこと
# 事前準備② このシェルのmyappの部分をアプリ名にリネーム
# 事前準備③ docker-compose.ymlのmysqlのバージョンを任意に編集
# 事前準備④ DockerfileのPHPバージョンを任意に編集

# 準備が終わったら、「sh startup.sh」で起動
docker run --rm -v $(pwd):/app composer create-project  laravel/laravel myapp --prefer-dist "^8.0"

# プロジェクト内部に入り、appと同階層にdocker-compose.ymlを配置
mkdir myapp
mv docker-compose.yml myapp/.
# ymlと組み合わせて使うファイルを移動する
# webコンテナDockerfile
# apche設定ファイル
# php設定ファイル
mv docker myapp/.

# コンテナ群の起動 キャッシュを使わずに、デタッチで起動する
# no-cacheしないと過去の設定が生きたコンテナが立ってしまうことがある
# 既に他のプロジェクトで同様のコンテナを立てている際は、--force-recreate で強制的にコンテナを作り直すことができる
cd myapp
docker-compose up -d --no-cache

docker exec -it myapp_web_1 bash
chmod -R 777 /var/www/myapp/storage
chmod -R 777 /var/www/myapp/bootstrap
php artisan key:generate

# docker-compose.ymlに合わせたDB設定をlaravelの.envにに記述
# 最後に、php artisan migrateして終了!

# DB_CONNECTION=mysql
# DB_HOST=mysql(servicesに書いてあるDBサービス名)
# DB_PORT=3306
# DB_DATABASE=db
# DB_USERNAME=user
# DB_PASSWORD=pw
