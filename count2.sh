#

date
files=`find android-sdk-sources-for-api-level-5 -name '*.java'`
count=0
lines=0
tokens=0
nodes=0
mkdir a5
for i in $files
do
	echo "$i"
	csharp-parser/bin/Release/netcoreapp3.0/Test.exe -t "$i" | grep '^[ ]*[(]' | sed 's/^[ ]*[(][ ]\([^ ]*\).*/\1/' | sort | uniq -c | sort -k 1n > a5/counts.$(basename "$i")
done

date
files=`find android-sdk-sources-for-api-level-29 -name '*.java'`
count=0
lines=0
tokens=0
nodes=0
mkdir a29
for i in $files
do
	echo "$i"
	csharp-parser/bin/Release/netcoreapp3.0/Test.exe -t "$i" | grep '^[ ]*[(]' | sed 's/^[ ]*[(][ ]\([^ ]*\).*/\1/' | sort | uniq -c | sort -k 1n > a29/counts.$(basename "$i")
done

date
files=`find jdk/src -name '*.java'`
count=0
lines=0
tokens=0
nodes=0
mkdir j
for i in $files
do
	echo "$i"
	csharp-parser/bin/Release/netcoreapp3.0/Test.exe -t "$i" | grep '^[ ]*[(]' | sed 's/^[ ]*[(][ ]\([^ ]*\).*/\1/' | sort | uniq -c | sort -k 1n > j/counts.$(basename "$i")
done
date
