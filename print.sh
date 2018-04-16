#!/usr/bin/env bash
# test 2
lsb_release -a
echo Uploading artifact: http://dummy/repo/hello-karyon-rxnetty_1-1_all.deb
curl -F file=@build/distributions/hello-karyon-rxnetty_1-1_all.deb http://35.197.61.70:8080/api/files/karyon
curl -X POST http://35.197.61.70:8080/api/repos/my-karyon-rxnetty/file/karyon
curl -X PUT -H 'Content-Type: application/json' --data '{"Distribution": "trusty", "ForceOverwrite": true, "Architectures":["amd64"], "Signing": {"Skip": true}, "SourceKind": "local", "Sources": [{"Name":"my-karyon-rxnetty"}]}' http://35.197.61.70:8080/api/publish/:./trusty
