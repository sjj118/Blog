# Blog

## Abstract

Preview and deploy the hexo blog within the docker image.

## Initialization

```bash
# Set your hexo blog root directory
BlogDir=~/Blog
# Remember to put your "_config.yml", "source" and "themes" into the above directory

# Create the preview container
docker create --name hexo-server \
-p 4000:4000 \
-v $BlogDir/_config.yml:/website/_config.yml:ro \
-v $BlogDir/source:/website/source:ro \
-v $BlogDir/themes:/website/themes:ro \
sjj118/blog hexo server

# Create the deploy container
docker create --name hexo-deploy -t \
-v $BlogDir/_config.yml:/website/_config.yml:ro \
-v $BlogDir/source:/website/source:ro \
-v $BlogDir/themes:/website/themes:ro \
-v ~/.gitconfig:/root/.gitconfig:ro \
-v ~/.ssh:/root/.ssh:ro \
-v $BlogDir/.deploy_git:/website/.deploy_git \
sjj118/blog sh -c "hexo clean && hexo deploy"
# If you prefer to clear the old commit at each deployment, delete this line: -v $BlogDir/.deploy_git:/website/.deploy_git \

# Clone the old deployed file from your git repo
git clone https://github.com/sjj118/sjj118.github.io.git $BlogDir/.deploy_git
```

## Usage

```bash
# Deploy the hexo blog
docker start -i hexo-deploy

# Start the preview server
docker start -i hexo-server

# Start the preview server in background
docker start hexo-server

# Stop the preview server in background
docker stop hexo-server

```
