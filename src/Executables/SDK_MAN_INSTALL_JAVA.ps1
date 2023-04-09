sdk install java
$env:JAVA_HOME="C:\Users\" + $env:UserName + "\.sdkman\candidates\java\current"
[Environment]::SetEnvironmentVariable("JAVA_HOME", $env:INCLUDE, [System.EnvironmentVariableTarget]::User)
[Environment]::SetEnvironmentVariable(
    "Path",
    [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";C:\Users\" + $env:UserName + "\.sdkman\candidates\java\current",
    [EnvironmentVariableTarget]::Machine)