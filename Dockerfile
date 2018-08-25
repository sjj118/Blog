FROM sjj118/dockerhexo:latest

RUN apt-get install -y pandoc

RUN cnpm install hexo-renderer-pandoc --save
RUN cnpm install hexo-deployer-git --save
