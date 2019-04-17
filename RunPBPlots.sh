for f in /user/hbirch/Documents/LZ_experiment/OCS_Root_Files/data_V1.2/PB09_to_PB16/PB*;
  do 
     [ -d $f ] && cd "$f" && echo Entering into $f
     ls | wc -l 

     for rootfile in *.root
     do
	 echo "$rootfile"
	 echo "$f/$rootfile"

	 foldername=${PWD##*/}
	 echo "$foldername"
	 PBNum=${foldername:2}
	 echo "$PBNum"
#	 root -q ../PBplots2.C+(\"$f/$rootfile\",$PBNum)
	 root -q /user/hbirch/Documents/LZ_experiment/OCS_Root_Files/data_V1.2/PB09_to_PB16/Analysis.C+(\"$f/$rootfile\",$PBNum)
#	 root -q ../fstPlots1ch1.C+(\"$f/$rootfile\",$PBNum)
     done

#     pdfnup NphVStrwidth$foldername.pdf PulseWidthVSnph$foldername.pdf --nup 1x2 --no-landscape -o joint.pdf
     pdfnup PulseWidthVSnph$foldername.pdf twVSlnph_with_residuals_$foldername.pdf --nup 1x2 --no-landscape -o joint.pdf
     pdfnup nph$foldername.pdf joint.pdf -o PulserBoard$PBNum.pdf
     cp PulserBoard$PBNum.pdf /user/hbirch/Documents/LZ_experiment/FST_Old_Firmware_plots
     rm joint.pdf

     cd /user/hbirch/Documents/LZ_experiment/OCS_Root_Files/data_V1.2/PB09_to_PB16
  done;



# TWVSlnphPB%02d.pdf

#Original line before changing PWvsNPH to TWvsLNPH 
# pdfnup NphVStrwidth$foldername.pdf PulseWidthVSnph$foldername.pdf --nup 1x2 --no-landscape -o joint.pdf