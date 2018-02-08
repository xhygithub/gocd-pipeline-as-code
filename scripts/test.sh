#! /bin/bash

set -e
REGISTRY="nexus.xxxxxx.com.cn:5000"

docker run --rm  -v $(pwd)/mysite:/mysite  -w /mysite ${REGISTRY}/common/python:3.6.3 \
    /bin/bash -c "pip install -r requirements.txt; python manage.py test; chown -R 1000:1000 ./*"

res=$?
exit $res
