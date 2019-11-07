#

cd java-parser
cp ../grammars-v4/java/Java*.g4 .
"$JAVA_HOME/bin/java.exe" -jar "$Antlr4ToolPath" *.g4
javac -cp 'C:\Program Files\Java\javalib\antlr-4.7.2-complete.jar' *.java
"$JAVA_HOME/bin/java.exe" -cp ".;$Antlr4ToolPath" FunctionValidate


files=`find ../jdk/src -name '*.java'`
for i in $files
do
	lines=`wc $i | awk '{print $1}'`
	start=`date +%s.%N`
	data=`"$JAVA_HOME/bin/java.exe" -cp ".;$Antlr4ToolPath" FunctionValidate $i`
	end=`date +%s.%N`
	runtime=`awk "BEGIN {print $end - $start }"`
	echo $runtime $lines $data $i
done

files=`find ../../android-sdk-sources-for-api-level-5 -name '*.java'`
for i in $files
do
	lines=`wc $i | awk '{print $1}'`
	start=`date +%s.%N`
	"$JAVA_HOME/bin/java.exe" -cp ".;$Antlr4ToolPath" FunctionValidate $i
	end=`date +%s.%N`
	runtime=`awk "BEGIN {print $end - $start }"`
	echo $runtime $lines $i
done
