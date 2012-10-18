#!/system/bin/sh
# Copyright (c) 2010, Code Aurora Forum. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.
#     * Neither the name of Code Aurora Forum, Inc. nor the names of its
#       contributors may be used to endorse or promote products derived
#       from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
# ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#

# No path is set up at this point so we have to do it here.
PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

mount -t vfat -o ro,fmask=0133,dmask=0022,shortname=lower /dev/block/mmcblk0p17 /vendor/firmware/misc
mount -t vfat -o ro,fmask=0133,dmask=0022,shortname=lower /dev/block/mmcblk0p18 /vendor/firmware/misc_mdm

# Check for images and set up symlinks
cd /vendor/firmware/misc

case `ls modem.mdt 2>/dev/null` in
    modem.mdt)
        for imgfile in modem*; do
            ln -s /vendor/firmware/misc/$imgfile /vendor/firmware/$imgfile 2>/dev/null
        done
        break
        ;;
    *)
        log -p w -t PIL 8660 device but no modem image found
        ;;
esac

case `ls q6.mdt 2>/dev/null` in
    q6.mdt)
        for imgfile in q6*; do
            ln -s /vendor/firmware/misc/$imgfile /vendor/firmware/$imgfile 2>/dev/null
        done
        break
        ;;
    *)
        log -p w -t PIL 8660 device but no q6 image found
        ;;
esac

MISC_MDM=/vendor/firmware/misc_mdm/image
cd $MISC_MDM
ln -s $MISC_MDM/amss.mbn /vendor/firmware/amss.mbn 2>/dev/null
ln -s $MISC_MDM/dsp1.mbn /vendor/firmware/dsp1.mbn 2>/dev/null
ln -s $MISC_MDM/dsp2.mbn /vendor/firmware/dsp2.mbn 2>/dev/null
ln -s $MISC_MDM/dbl.mbn /vendor/firmware/dbl.mbn 2>/dev/null
ln -s $MISC_MDM/osbl.mbn /vendor/firmware/osbl.mbn 2>/dev/null
ln -s $MISC_MDM/efs1.mbn /vendor/firmware/efs1.mbn 2>/dev/null
ln -s $MISC_MDM/efs2.mbn /vendor/firmware/efs2.mbn 2>/dev/null
ln -s $MISC_MDM/htcssmem.mbn /vendor/firmware/htcssmem.mbn 2>/dev/null


cd /

