#

cd java-parser

date

files=`find ../android-sdk-sources-for-api-level-5 -name '*.java'`
for i in $files
do
	lines=`wc $i | awk '{print $1}'`
	data=`"$JAVA_HOME/bin/java.exe" -cp ".;$Antlr4ToolPath" FunctionValidate -p "$i" | tr '\n' ' ' | tr '\r' ' '`
	echo "li $lines in $data f $i"
done

date

files=`find ../android-sdk-sources-for-api-level-29 -name '*.java'`
for i in $files
do
	lines=`wc $i | awk '{print $1}'`
	data=`"$JAVA_HOME/bin/java.exe" -cp ".;$Antlr4ToolPath" FunctionValidate -p "$i" | tr '\n' ' ' | tr '\r' ' '`
	echo "li $lines in $data f $i"
done

date

files=`find ../jdk/src -name '*.java'`
for i in $files
do
	lines=`wc $i | awk '{print $1}'`
	data=`"$JAVA_HOME/bin/java.exe" -cp ".;$Antlr4ToolPath" FunctionValidate -p "$i" | tr '\n' ' ' | tr '\r' ' '`
	echo "li $lines in $data f $i"
done

date

cd ..
cd java9-parser

date

files=`find ../android-sdk-sources-for-api-level-5 -name '*.java'`
for i in $files
do
	lines=`wc $i | awk '{print $1}'`
	data=`"$JAVA_HOME/bin/java.exe" -cp ".;$Antlr4ToolPath" FunctionValidate -p "$i" | tr '\n' ' ' | tr '\r' ' '`
	echo "li $lines in $data f $i"
done

date

files=`find ../android-sdk-sources-for-api-level-29 -name '*.java'`
for i in $files
do
	lines=`wc $i | awk '{print $1}'`
	data=`"$JAVA_HOME/bin/java.exe" -cp ".;$Antlr4ToolPath" FunctionValidate -p "$i" | tr '\n' ' ' | tr '\r' ' '`
	echo "li $lines in $data f $i"
done

date

files=`find ../jdk/src -name '*.java'`
for i in $files
do
	lines=`wc $i | awk '{print $1}'`
	data=`"$JAVA_HOME/bin/java.exe" -cp ".;$Antlr4ToolPath" FunctionValidate -p "$i" | tr '\n' ' ' | tr '\r' ' '`
	echo "li $lines in $data f $i"
done

date
