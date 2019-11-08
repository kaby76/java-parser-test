#

date

cd csharp-parser

files=`find ../android-sdk-sources-for-api-level-5 -name '*.java'`
for i in $files
do
	echo $i
	
	lines=`wc $i | awk '{print $1}'`
	start=`date +%s.%N`
	bin/Release/netcoreapp3.0/Test.exe -t "$i" > parse-out 2> /dev/null
	end=`date +%s.%N`
	runtime=`awk "BEGIN {print $end - $start }"`

	cd ../java-parser

	lines=`wc $i | awk '{print $1}'`
	start=`date +%s.%N`
	"$JAVA_HOME/bin/java.exe" -cp ".;$Antlr4ToolPath" FunctionValidate -t $i > parse-out 2> /dev/null
	end=`date +%s.%N`
	runtime=`awk "BEGIN {print $end - $start }"`

	diff parse-out ../csharp-parser/parse-out

	cd ../csharp-parser

	date
done
