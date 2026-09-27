ALL: version.h

# Always run the generator: the version comes from git, which make can't
# track. The script only rewrites version.h when the version changes.
version.h: FORCE
	bash ../../Tools/generate_version_header.sh

FORCE:

.PHONY: install clean distclean FORCE

install: ALL

clean:
	-rm version.h 2>/dev/null

distclean: clean
