# for every file in current directory with .nii suffix
for i in `ls *.nii`; do
# check if a file with the same name exists in "../atlasAffineTrans/$i.txt" (assumes you are in N3?)
if [ ! -f ../atlasAffineTrans/${i::-3}.txt ]; then
  # print file name
  echo $i
  /home/jessica-bohm/niftyreg/build/reg-apps/reg_aladin -ref $i -flo ../../../MDSC689.03-Final-Project/atlases/human_atlas_bet.nii -aff ../atlasAffineTrans/${i::-3}txt -res ../atlasAffineRegs/$i
  fi
done
