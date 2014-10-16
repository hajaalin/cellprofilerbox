# Package the LoG3D plugin in a .jar.
# If you use this plugin, remember to cite the authors.
# See http://bigwww.epfl.ch/sage/soft/LoG3D/ for more info.
mkdir tmp; cd tmp
curl -O http://bigwww.epfl.ch/sage/soft/LoG3D/LoG3D.zip
unzip LoG3D.zip
mv LoG3D/* .
rmdir LoG3D
cp ../plugins.config.LoG3D plugins.config
jar cvf ../plugins/LoG_3D.jar .
cd ..
rm -rf tmp
