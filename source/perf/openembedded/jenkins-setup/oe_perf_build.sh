###############################################################################

#This script build estuary kernel and kernel/tools/perf on openembedded build setup. 

################################################################################
#!/bin/bash

sudo bash pre-build-root-install-dependencies.sh
bash init-and-build.sh
cd openembedded-core
source oe-init-build-env ../build
bitbake linaro-image-lamp 
