cp arch/arm/boot/zImage zip-creator
RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo "zImage was found"
else
  echo "failed to copy zImage"
  echo "zImage could't find"
exit
fi

find . -name *.ko | xargs cp -a --target-directory=zip-creator/system/lib/modules/ &> /dev/null

cd zip-creator
zip -r fenerbahce_kernel-fbli_41-$(date +%d.%m.%y#%H.%M) * -x */.gitignore *.zip &> /dev/null
cd ..

echo "Clear old files?"
echo "(y or n)"
echo ""
echo -n "Enter option: "
read choice

case $choice in

y)
rm -rf zip-creator/zImage zip-creator/system/lib/modules/*.ko
make clean mrproper &> /dev/null | echo "cleaning"
echo "done"
exit 0
;;
n)
echo "Nothing cleaned"
esac
exit 0
