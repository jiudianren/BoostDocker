使用bjam(或b2)来编译boost
bjam命令参数分析
以下面的命令作为示例来分析各个参数的作用
bjam stage --toolset=msvc-14.0 --without-python --stagedir="X:\boost\vc14" link=static runtime-link=shared runtime-link=static threading=multi debug release

stage/install：
stage表示只生成库（dll和lib），install还会生成包含头文件的include目录。推荐使用stage，因为install生成的这个include目录实际就是boost安装包解压缩后的boost目录（X:\boost_X_XX_X\boost，只比include目录多几个非hpp文件，都很小），所以可以直接使用，而且不同的IDE都可以使用同一套头文件，这样既节省编译时间，也节省硬盘空间。

toolset：
指定编译器，可选的如borland、gcc、msvc（VC6）、msvc-12.0（VS2013）、msvc-14.0（VS2015）等。

without/with：
选择不编译/编译哪些库。因为python、mpi等库我都用不着，所以排除之。还有wave、graph、math、regex、test、program_options、serialization、signals这几个库编出的静态lib都非常大，所以不需要的也可以without。这可以根据各人需要进行选择，默认是全部编译。但是需要注意，如果选择编译python的话，是需要python语言支持的，可以到python官方主页下载安装。
查看boost包含库的命令是bjam --show-libraries。

stagedir/prefix：
stage时使用stagedir，install时使用prefix，表示编译生成文件的路径。推荐给不同的IDE指定不同的目录，如VS2015对应的是

X:\boost_X_XX_X\vc14

如果使用了install参数，那么还将生成头文件目录，vc14对应的就是

X:\boost_X_XX_X\boost\bin\vc14\include\boost_X_XX_X\boost

build-dir：
编译生成的中间文件的路径。这个本人这里没用到，默认就在根目录（X:\boost_X_XX_X\boost）下，目录名为bin.v2，等编译完成后可将这个目录全部删除（没用了），所以不需要去设置。

link：
生成动态链接库/静态链接库。生成动态链接库需使用shared方式，生成静态链接库需使用static方式。一般boost库可能都是以static方式编译，因为最终发布程序带着boost的dll感觉会比较累赘。

runtime-link：
动态/静态链接C/C++运行时库。同样有shared和static两种方式，这样runtime-link和link一共可以产生4种组合方式，各人可以根据自己的需要选择编译。

threading：
单/多线程编译。一般都写多线程程序，当然要指定multi方式了；如果需要编写单线程程序，那么还需要编译单线程库，可以使用single方式。

debug/release：
编译debug/release版本。一般都是程序的debug版本对应库的debug版本，所以两个都编译。



https://www.jianshu.com/p/de1fda741beb