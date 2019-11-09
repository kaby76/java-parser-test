#

cd csharp-parser

date

files=`find ../android-sdk-sources-for-api-level-5 -name '*.java'`
for i in $files
do
	lines=`wc $i | awk '{print $1}'`
	data=`bin/Release/netcoreapp3.0/Test.exe -p "$i" | tr '\n' ' ' | tr '\r' ' '`
	echo "li $lines in $data f $i"
done

date

files=`find ../android-sdk-sources-for-api-level-29 -name '*.java'`
for i in $files
do
	lines=`wc $i | awk '{print $1}'`
	data=`bin/Release/netcoreapp3.0/Test.exe -p "$i" | tr '\n' ' ' | tr '\r' ' '`
	echo "li $lines in $data f $i"
done

date

files=`find ../jdk/src -name '*.java'`
for i in $files
do
	lines=`wc $i | awk '{print $1}'`
	data=`bin/Release/netcoreapp3.0/Test.exe -p "$i" | tr '\n' ' ' | tr '\r' ' '`
	echo "li $lines in $data f $i"
done

date

cd ..
cd csharp9-parser

date

files=`find ../android-sdk-sources-for-api-level-5 -name '*.java'`
for i in $files
do
	lines=`wc $i | awk '{print $1}'`
	data=`bin/Release/netcoreapp3.0/Test.exe -p "$i" | tr '\n' ' ' | tr '\r' ' '`
	echo "li $lines in $data f $i"
done

date

files=`find ../android-sdk-sources-for-api-level-29 -name '*.java'`
for i in $files
do
	lines=`wc $i | awk '{print $1}'`
	data=`bin/Release/netcoreapp3.0/Test.exe -p "$i" | tr '\n' ' ' | tr '\r' ' '`
	echo "li $lines in $data f $i"
done

date

files=`find ../jdk/src -name '*.java'`
for i in $files
do
	lines=`wc $i | awk '{print $1}'`
	data=`bin/Release/netcoreapp3.0/Test.exe -p "$i" | tr '\n' ' ' | tr '\r' ' '`
	echo "li $lines in $data f $i"
done

date
