# DeepSky

Python Deep Learning library for Skydipper

## Build issues

- tensorflow/tensorflow:latest-gpu-py3-jupyter has certificate issues and doesn't want to apt update anymore. I changed it to tensorflow/tensorflow:latest-gpu-py3-jupyter

- Dependencies have conflicts in:
  
   ```o
      Collecting tensorboard==2.1.1
   Downloading tensorboard-2.1.1-py3-none-any.whl (3.8 MB)
      ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 3.8/3.8 MB 44.2 MB/s eta 0:00:00
   ERROR: Could not find a version that satisfies the requirement tensorflow==2.1.0 (from deepsky) (from versions: 2.2.0, 2.2.1, 2.2.2, 2.2.3, 2.3.0, 2.3.1, 2.3.2, 2.3.3, 2.3.4, 2.4.0, 2.4.1, 2.4.2, 2.4.3, 2.4.4, 2.5.0, 2.5.1, 2.5.2, 2.5.3, 2.6.0rc0, 2.6.0rc1, 2.6.0rc2, 2.6.0, 2.6.1, 2.6.2, 2.6.3, 2.6.4, 2.7.0rc0, 2.7.0rc1, 2.7.0, 2.7.1, 2.7.2, 2.8.0rc0, 2.8.0rc1, 2.8.0, 2.8.1, 2.9.0rc0, 2.9.0rc1, 2.9.0rc2, 2.9.0)
   ERROR: No matching distribution found for tensorflow==2.1.0
   ```

- Which raise the question, why install tensorflow when it is using the tensorflow image? and why does pip not recognize that there's a system tensorflow installed?

## Fixes roadmap

- (?) Make the code work as a simple script instead of an installed package

- (?) Rebuild the package structure from scratch with updated dependencies and new setuptools package estructure (`pyproject.toml` and `setup.cfg`).

- Remove google cloud related methods in the training class like `check_deployment_status`, `train_model_ai_platform` and `deploy_model_ai_platform`. Add training methods for local machine.*

- Same as before but with validation and prediction classes.

- tests?

\* Looks like all the ML related stuff is delegated to Google cloud and the module only prepares and extracts the payload to call the google api.
So in order to train, evaluate and deploy models locally we have two possible options:

1. Rewrite nearly everything from scratch

this way we loose the GC flexibility to choose which kind of model and so. Needs quite more exploration and thinking.

2. Remap the google cloud api to the local machine

I have no clue if it is even possible. Needs exploration.
  
## Development:

`sh start.sh gpu <port>`
`docker exec -it mlnotebooks /bin/bash`