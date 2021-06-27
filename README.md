# imaginaryShort tech blog
- 技術記事や論文まとめなどを気軽にシェアするためのサイト
- https://blog.imaginaryshort.com/

## 更新方法
### 開発方針
- `master`ブランチがGithub pagesとして `blog.imaginaryshort.com` で配信されています
- サイトを更新する際は適宜ブランチを切って更新作業を行ってください
- 作業終了後にGithubへ該当ブランチをpushしたうえで、pull requestで `master`ブランチにマージしてください
- `master`ブランチに更新が入るとGithub CIが走り、正常終了すると本番環境に反映されます

### ローカル開発環境
- 開発環境入りのDockerfileを用意したので、こちらを利用します
- `docker-compose up` を実行すると `localhost:4000` にローカルサーバが起動します
  - 初回はDocker imageのビルドが走るので多少時間がかかります
  - Dockerfileを更新したときは `docker-compose up --build` を実行してください
- ローカルサーバは `ctrl + c` で停止できます

