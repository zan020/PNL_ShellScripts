#! /bin/bash

function WM {
	dir=$1
	ID=$3 
	time = $4 
	echo 'now processing' $ID $time
	ConvertBetweenFileFormats EMSeg/$ID-$time'_pve_2.nii.gz' EMSeg/$ID-$time'_pve_2.nrrd'
	echo 'conversion done'

	unu 2op gte EMSeg/$ID-$time'_pve_2.nrrd' 0.99 -o $dir/$ID-$time'_WMmask.nrrd'
    unu 2op x $dir/*t1w-mask-realign.EMSegged.cerebellum.nrrd $dir/$ID-$time'_WMmask.nrrd' -o $dir/$ID-$time'_WMmask.nrrd'
}


while read case; do
	WM ${case}
done < caselist.txt

# signle mask
#WM $1 $2 $3 $4