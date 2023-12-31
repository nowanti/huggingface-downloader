## 大语言模型下载站

HuggingFace.co资源下载网站，为AI开发者提供模型镜像加速服务，通过下载器可以达到10M/s的下载速度，解决大模型下载时间长、经常断线、需要反复重试等问题，实现镜像加速、断点续传、无人值守下载，参见 [源码](https://github.com/git-cloner/aliendao) 。

大语言模型的应用，见  [https://gitclone.com/aiit/chat/ ](https://gitclone.com/aiit/chat/) ，可以体验到ChatGLM2-6B、Vicuna-7B、通义千问-7B和LLama2-7B四种模型的服务。

### 1、模型下载方法

#### 方法1：用下载器下载

```bash
pip install huggingface_hub
python model_download.py --repo_id 模型ID --mirror
# 例如
python model_download.py --repo_id Qwen/Qwen-7B --mirror
```

![](https://gitclone.com/download1/aliendao/aliendao.gif)

#### 方法2：从本站页面下载

从本站的models、datasets查找模型或数据集下载，下载时建议用复制按钮将下载网址复制到新的标签页下载，这样速度更快。

### 2、模型装载方法

（1）将模型下载到本地文件夹

（2）AutoModel.from_pretrained的pretrained_model_name_or_path参数指向到本地文件夹

```python
# 以THUDM/chatglm-6b模型为例
# model_path = "THUDM/chatglm-6b" #从huggingface.co装载模型的方法
model_path = "./model/"           #从本地文件夹装载模型的方法
tokenizer = AutoTokenizer.from_pretrained(model_path, trust_remote_code=True)
model = AutoModel.from_pretrained(model_path,trust_remote_code=True).half().cuda()
```

### 3、其他说明

（1）aliendao.cn的模型资源还在持续同步中，如果模型文件夹中包含~incomplete.txt文件，说明正在同步中，镜像暂不可用

（2）请勿使用迅雷等工具下载