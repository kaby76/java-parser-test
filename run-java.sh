#

cd java-parser

date

files=`find ../android-sdk-sources-for-api-level-5 -name '*.java'`
for i in $files
do
	lines=`wc $i | awk '{print $1}'`
	start=`date +%s.%N`
	data=`"$JAVA_HOME/bin/java.exe" -cp ".;$Antlr4ToolPath" FunctionValidate $i`
	end=`date +%s.%N`
	runtime=`awk "BEGIN {print $end - $start }"`
	echo $runtime $lines $data $i
done

date

files=`find ../android-sdk-sources-for-api-level-29 -name '*.java'`
for i in $files
do
	lines=`wc $i | awk '{print $1}'`
	start=`date +%s.%N`
	data=`"$JAVA_HOME/bin/java.exe" -cp ".;$Antlr4ToolPath" FunctionValidate $i`
	end=`date +%s.%N`
	runtime=`awk "BEGIN {print $end - $start }"`
	echo $runtime $lines $data $i
done

date

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

date
