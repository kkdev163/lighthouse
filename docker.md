### 镜像依赖关系
webapm/lighthouse 覆盖Lighthouse-cli
    webapm/google-chrome-headless-node 覆盖node环境
        femtopixel/google-chrome-headless 基础镜像

### 镜像构建
首次构建
```
docker build -t webapm/google-chrome-headless-node -f Dockerfile.node --build-arg --no-cache=1 .
```

之后改动Lighthouse源码，只需要构建最顶层的镜像即可。
```
docker build -t music163fn/wapm-lighthouse:5.2.0-chrome69-190916 -f Dockerfile --build-arg VERSION=5.2.0-190916 --no-cache=1 .
```

### 镜像使用
参数是透传给lighthouse的，所以可以用如下命令:
```
docker run --privileged -v /tmp/lighthouse:/home/chrome/reports music163fn/wapm-lighthouse:5.2.0-chrome69-190827  --chrome-flags=\'--headless --disable-gpu\' --only-categories=performance chrome://version
```
报告可在host机上的/tmp/lighthouse目录查看到