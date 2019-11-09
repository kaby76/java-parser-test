#

date

cd java-parser
cp ../grammars-v4/java/Java*.g4 .
"$JAVA_HOME/bin/java.exe" -jar "$Antlr4ToolPath" *.g4
javac -cp 'C:\Program Files\Java\javalib\antlr-4.7.2-complete.jar' *.java
"$JAVA_HOME/bin/java.exe" -cp ".;$Antlr4ToolPath" FunctionValidate
cd ..

date

cd java9-parser
cp ../grammars-v4/java9/Java9.g4 .
"$JAVA_HOME/bin/java.exe" -jar "$Antlr4ToolPath" *.g4
javac -cp 'C:\Program Files\Java\javalib\antlr-4.7.2-complete.jar' *.java
"$JAVA_HOME/bin/java.exe" -cp ".;$Antlr4ToolPath" FunctionValidate
cd ..

date

cd csharp-parser
cp ../grammars-v4/java/Java*.g4 .
dotnet restore
dotnet build -c Release
dotnet run -c Release
cd ..

date

cd csharp9-parser
cp ../java9-csharp/Java9.g4 .
dotnet restore
dotnet build -c Release
dotnet run -c Release
cd ..

date
