#!/usr/bin/env bash
# test 2
echo Uploading artifact: http://dummy/repo/hello-karyon-rxnetty_1-1_all.deb
curl -F file=@build/distributions/hello-karyon-rxnetty_1-1_all.deb http://35.197.61.70:8080/api/files/hello-karyon-rxnetty
curl -X POST http://35.197.61.70:8080/api/repos/hello-karyon-rxnetty/file/hello-karyon-rxnetty
curl -X PUT -H 'Content-Type: application/json' --data '{"Distribution": "trusty", "ForceOverwrite": true, "Architectures":["amd64"], "Signing": {"Skip": true}, "SourceKind": "local", "Sources": [{"Name":"hello-karyon-rxnetty"}]}' http://35.197.61.70:8080/api/publish/:./trusty
