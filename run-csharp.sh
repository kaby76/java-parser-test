#

cd csharp-parser

date

files=`find ../android-sdk-sources-for-api-level-5 -name '*.java'`
for i in $files
do
	lines=`wc $i | awk '{print $1}'`
	start=`date +%s.%N`
	bin/Release/netcoreapp3.0/Test.exe -p "$i"
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
	bin/Release/netcoreapp3.0/Test.exe -p "$i"
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
	bin/Release/netcoreapp3.0/Test.exe -p "$i"
	end=`date +%s.%N`
	runtime=`awk "BEGIN {print $end - $start }"`
	echo $runtime $lines $data $i
done

date
