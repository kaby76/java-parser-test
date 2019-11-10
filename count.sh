#

date
files=`find android-sdk-sources-for-api-level-5 -name '*.java'`
count=0
lines=0
tokens=0
nodes=0
for i in $files
do
	t=`csharp-parser/bin/Release/netcoreapp3.0/Test.exe -i "$i" | wc | awk '{print $1}'`
	n=`csharp-parser/bin/Release/netcoreapp3.0/Test.exe -t "$i" | grep -v HIDDEN | grep -v '^[ ]*[)]' | wc | awk '{print $1}'`
	count=`awk "BEGIN { print $count + 1 }"`
	l=`wc $i | awk '{print $1}'`
	lines=`awk "BEGIN { print $lines + $l }"`
	tokens=`awk "BEGIN { print $tokens + $t }"`
	nodes=`awk "BEGIN { print $nodes + $n }"`
done
echo "count '$count' lines '$lines' tokens '$tokens' nodes '$nodes'"

date
files=`find android-sdk-sources-for-api-level-29 -name '*.java'`
count=0
lines=0
tokens=0
nodes=0
for i in $files
do
	t=`csharp-parser/bin/Release/netcoreapp3.0/Test.exe -i "$i" | wc | awk '{print $1}'`
	n=`csharp-parser/bin/Release/netcoreapp3.0/Test.exe -t "$i" | grep -v HIDDEN | grep -v '^[ ]*[)]' | wc | awk '{print $1}'`
	count=`awk "BEGIN { print $count + 1 }"`
	l=`wc $i | awk '{print $1}'`
	lines=`awk "BEGIN { print $lines + $l }"`
	tokens=`awk "BEGIN { print $tokens + $t }"`
	nodes=`awk "BEGIN { print $nodes + $n }"`
done
echo "count '$count' lines '$lines' tokens '$tokens' nodes '$nodes'"

date
files=`find jdk/src -name '*.java'`
count=0
lines=0
tokens=0
nodes=0
for i in $files
do
	t=`csharp-parser/bin/Release/netcoreapp3.0/Test.exe -i "$i" | wc | awk '{print $1}'`
	n=`csharp-parser/bin/Release/netcoreapp3.0/Test.exe -t "$i" | grep -v HIDDEN | grep -v '^[ ]*[)]' | wc | awk '{print $1}'`
	count=`awk "BEGIN { print $count + 1 }"`
	l=`wc $i | awk '{print $1}'`
	lines=`awk "BEGIN { print $lines + $l }"`
	tokens=`awk "BEGIN { print $tokens + $t }"`
	nodes=`awk "BEGIN { print $nodes + $n }"`
done
echo "count '$count' lines '$lines' tokens '$tokens' nodes '$nodes'"
date
