## Usage

Create the server container:

```bash
docker create --name hexo-server \
-p 4000:4000 \
-v ~/Blog/_config.yml:/website/_config.yml:ro \
-v ~/Blog/source:/website/source:ro \
-v ~/Blog/themes:/website/themes:ro \
sjj118/blog hexo server
```


Create the deploy container:

```bash
docker create --name hexo-deploy -t \
-v ~/Blog/_config.yml:/website/_config.yml:ro \
-v ~/Blog/source:/website/source:ro \
-v ~/Blog/themes:/website/themes:ro \
-v ~/.gitconfig:/root/.gitconfig:ro \
-v ~/.ssh:/root/.ssh:ro \
sjj118/blog hexo deploy
```
