# 参考にしたHP https://mossa.dev/post/laravel_docker_lamp/

# 事前準備① docker-compose.ymlのDB項目(environment)をアプリに合わせて編集、このシェルと同じ階層に置いておくこと
# 事前準備② このシェルのmy-siteの部分をアプリ名にリネーム
# 事前準備③ docker-compose.ymlのmysqlのバージョンを任意に編集
# 事前準備④ DockerfileのPHPバージョンを任意に編集

# 準備が終わったら、「sh startup.sh」で起動
# バージョン設定も忘れずに
docker run --rm -v $(pwd):/app composer create-project  laravel/laravel my-site --prefer-dist "6.0.*"

# プロジェクト内部に入り、appと同階層にdocker-compose.ymlを配置
mv docker-compose.yml ./my-site
# ymlと組み合わせて使うファイルを移動する
# webコンテナDockerfile
# apche設定ファイル
# php設定ファイル
mv docker ./my-site

# コンテナ群の起動 キャッシュを使わずに、デタッチで起動する
# no-cacheしないと過去の設定が生きたコンテナが立ってしまうことがある
cd my-site
docker-compose up -d --no-cache

docker exec -it my-site_web_1 bash
chmod -R 777 /var/www/myapp/storage
chmod -R 777 /var/www/myapp/bootstrap
php artisan key:generate

# docker-compose.ymlに合わせたDB設定をlaravelの.envにに記述
# 最後に、php artisan migrateして終了!

# DB_CONNECTION=mysql
# DB_HOST=mysql(docker ps コマンドで 表示されるservicesに書いてあるDBコンテナ名)
# DB_PORT=3306
# DB_DATABASE=db
# DB_USERNAME=user
# DB_PASSWORD=pw
