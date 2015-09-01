if [ $# -ne 2 ]; then
 echo "Usage:"
 echo " installAndStart <target> <arch>"
 echo
 echo "Comments:"
 echo " <target> is the target passed to node-gyp in the form of X.XX.X (e.g. 0.31.0)"
 echo " <arch> is the architecture passed to node-gyp (e.g. x64)"
 echo
 echo "Example:"
 echo " ./installAndStart.sh 0.31.0 x64"
 exit 1
fi

npm install --production;
cd node_modules/ffi/node_modules/ref;
currentDir=`pwd`;
HOME=~/.electron-gyp $currentDir/../../../.bin/node-gyp rebuild --target=$1 --arch=$2 --dist-url=https://atom.io/download/atom-shell;
cd ../../;
HOME=~/.electron-gyp $currentDir/../../../.bin/node-gyp rebuild --target=$1 --arch=$2 --dist-url=https://atom.io/download/atom-shell;
cd ../../
echo;echo;echo;echo;
echo "Starting ELECTRON now..."
electron .
echo "After Electron started..."
