#

date

cd java-parser
cp ../grammars-v4/java/Java*.g4 .
"$JAVA_HOME/bin/java.exe" -jar "$Antlr4ToolPath" *.g4
javac -cp 'C:\Program Files\Java\javalib\antlr-4.7.2-complete.jar' *.java
"$JAVA_HOME/bin/java.exe" -cp ".;$Antlr4ToolPath" FunctionValidate
cd ..

date

cd csharp-parser
cp ../grammars-v4/java/Java*.g4 .
dotnet restore
dotnet build
dotnet run
cd ..

date
