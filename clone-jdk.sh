#

curDir=`pwd`
case "$var" in  
	*\ * )
		echo "You cannot use this script on a path that contains spaces."
		echo "The build scripts for OpenJDK are fucked up."
		exit 1
		;;
	*)
		;;
esac

hg version
retVal=$?
if [ $retVal -ne 0 ]
then
	echo "Whoops. Mecurial (hg) not working."
	echo 1
fi

# https://github.com/openjdk/jdk/blob/master/doc/building.md#getting-the-source-code
time hg clone http://hg.openjdk.java.net/jdk/jdk
time git clone https://github.com/AndroidSDKSources/android-sdk-sources-for-api-level-5.git
time git clone https://github.com/AndroidSDKSources/android-sdk-sources-for-api-level-29.git
