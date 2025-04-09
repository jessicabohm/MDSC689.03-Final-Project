for i in `ls *.nii`; do

# if the brainMask file for this image doesn't yet exist
  if [ ! -f ../brainMask/$i ]; then
    echo $i
    /home/jessica-bohm/niftyreg/build/reg-apps/reg_resample -ref $i -flo ../brainSegReformat.nii -res ../brainMask/$i -aff ../atlasAffineTrans/${i::-4}.txt -inter 0
    # next apply the spline to the just edited atlas in labels regs
    /home/jessica-bohm/niftyreg/build/reg-apps/reg_resample -ref $i -flo ../brainMask/$i -res ../brainMask/$i -cpp ../atlasSplineTrans/$i -inter 0
  fi
done

