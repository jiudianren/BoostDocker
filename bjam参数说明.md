ʹ��bjam(��b2)������boost
bjam�����������
�������������Ϊʾ����������������������
bjam stage --toolset=msvc-14.0 --without-python --stagedir="X:\boost\vc14" link=static runtime-link=shared runtime-link=static threading=multi debug release

stage/install��
stage��ʾֻ���ɿ⣨dll��lib����install�������ɰ���ͷ�ļ���includeĿ¼���Ƽ�ʹ��stage����Ϊinstall���ɵ����includeĿ¼ʵ�ʾ���boost��װ����ѹ�����boostĿ¼��X:\boost_X_XX_X\boost��ֻ��includeĿ¼�༸����hpp�ļ�������С�������Կ���ֱ��ʹ�ã����Ҳ�ͬ��IDE������ʹ��ͬһ��ͷ�ļ��������Ƚ�ʡ����ʱ�䣬Ҳ��ʡӲ�̿ռ䡣

toolset��
ָ������������ѡ����borland��gcc��msvc��VC6����msvc-12.0��VS2013����msvc-14.0��VS2015���ȡ�

without/with��
ѡ�񲻱���/������Щ�⡣��Ϊpython��mpi�ȿ��Ҷ��ò��ţ������ų�֮������wave��graph��math��regex��test��program_options��serialization��signals�⼸�������ľ�̬lib���ǳ������Բ���Ҫ��Ҳ����without������Ը��ݸ�����Ҫ����ѡ��Ĭ����ȫ�����롣������Ҫע�⣬���ѡ�����python�Ļ�������Ҫpython����֧�ֵģ����Ե�python�ٷ���ҳ���ذ�װ��
�鿴boost�������������bjam --show-libraries��

stagedir/prefix��
stageʱʹ��stagedir��installʱʹ��prefix����ʾ���������ļ���·�����Ƽ�����ͬ��IDEָ����ͬ��Ŀ¼����VS2015��Ӧ����

X:\boost_X_XX_X\vc14

���ʹ����install��������ô��������ͷ�ļ�Ŀ¼��vc14��Ӧ�ľ���

X:\boost_X_XX_X\boost\bin\vc14\include\boost_X_XX_X\boost

build-dir��
�������ɵ��м��ļ���·���������������û�õ���Ĭ�Ͼ��ڸ�Ŀ¼��X:\boost_X_XX_X\boost���£�Ŀ¼��Ϊbin.v2���ȱ�����ɺ�ɽ����Ŀ¼ȫ��ɾ����û���ˣ������Բ���Ҫȥ���á�

link��
���ɶ�̬���ӿ�/��̬���ӿ⡣���ɶ�̬���ӿ���ʹ��shared��ʽ�����ɾ�̬���ӿ���ʹ��static��ʽ��һ��boost����ܶ�����static��ʽ���룬��Ϊ���շ����������boost��dll�о���Ƚ���׸��

runtime-link��
��̬/��̬����C/C++����ʱ�⡣ͬ����shared��static���ַ�ʽ������runtime-link��linkһ�����Բ���4����Ϸ�ʽ�����˿��Ը����Լ�����Ҫѡ����롣

threading��
��/���̱߳��롣һ�㶼д���̳߳��򣬵�ȻҪָ��multi��ʽ�ˣ������Ҫ��д���̳߳�����ô����Ҫ���뵥�߳̿⣬����ʹ��single��ʽ��

debug/release��
����debug/release�汾��һ�㶼�ǳ����debug�汾��Ӧ���debug�汾���������������롣



https://www.jianshu.com/p/de1fda741beb