#!usr/bin/env sh

  dir= pathTotheDirectory
  output= output.csv

  sides=("left" "right")
  tracts=("tract1" "tract2" "tract3" "tract4" "tract5" "tract6") 
   
  echo ${tracts[@]} >> $output  #print horizontally
  
while read case; do

  array=() #empty the array before starts counting the tracts before every case
  array+=("${case},") #add the case number as the first element of the array
  echo "
Number of cases which contain fibers for each tract:
"
  for tract in "${tracts[@]}"; do
    for side in "${sides[@]}"; do
        
        echo "${tract} (${side}):" `ls ${dir}/pj*${tract}.${side}.vtk | wc -l` 
        #count the number of cases that contain the tract.side
       
        if [ -f ${dir}/${case}WM_${tract}.${side}.vtk ]; then
          array+=("1,")
        else
          array+=("0,")
        fi
    done
  done
echo ${array[@]} >> $output
