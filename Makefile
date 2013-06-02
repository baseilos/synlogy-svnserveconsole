PACKAGENAME=svnserveadmin
BUILDDIR=build
TARGETDIR=${BUILDDIR}/target
PACKAGEDIR=${BUILDDIR}/pkg
SPKDIR=${BUILDDIR}/spk
UIDIR=target/ui

package: clean prepare_package
	mkdir -p ${SPKDIR}
	tar -zcf ${PACKAGEDIR}/package.tgz -C ${TARGETDIR} `ls ${TARGETDIR}`
	tar -cf ${SPKDIR}/${PACKAGENAME}.spk -C ${PACKAGEDIR} `ls ${PACKAGEDIR}`

prepare_package: compile-src
	rm -rf ${PACKAGEDIR}
	mkdir -p ${PACKAGEDIR}
	cp INFO ${PACKAGEDIR}
	cp -Rp scripts/ ${PACKAGEDIR}
	cp -Rp WIZARD_UIFILES/ ${PACKAGEDIR}
	cp LICENSE ${PACKAGEDIR}
	cp PACKAGE_ICON.PNG ${PACKAGEDIR}
	cp PACKAGE_ICON_120.PNG ${PACKAGEDIR}

prepare_target:
	rm -rf ${TARGETDIR}
	mkdir -p ${TARGETDIR}
	cp -R ${UIDIR} ${TARGETDIR}

compile-src: clean prepare_target

clean:
	find . -type f -name '*~' -delete

clean-all: clean 
	rm -rf ${BUILDDIR}
