@echo OFF

sdk install java
set PATH=%PATH%;"C:\Users\" + %USERNAME%  + "\.sdkman\candidates\java\current"
echo %PATH%

@echo ON