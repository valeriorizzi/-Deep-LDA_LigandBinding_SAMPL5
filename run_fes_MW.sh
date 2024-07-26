
#folders with the replicas
array=(`seq 0 0`)

compute_fes() {
  cp ~/Scripts/funnel_FES_from_Reweighting.py .

  rm COLVAR*
  paste -d \\n 0/COLVAR.0 1/COLVAR.1 2/COLVAR.2 3/COLVAR.3 > COLVARMW

  head -n 1120004 COLVARMW > COLVARMW2 #cut to 140ns per replica, skip 15ns*4
  ./funnel_FES_from_Reweighting.py --skiprows 120000 --sigma 0.01 --bias opes.bias --colvar COLVARMW --cv cyl.z --bin 200 --temp 300 --min 0.3 --max 1.8 --rfunnel 0.2 --uat 1.5 --bat 0.8 --blocks 5 --outfile fes_blocks.dat
}

for i in ${array[@]}
do
  compute_fes &
done
wait

rm delta*
#calculate average and stdev of all replicas in time
grep 'fundeltaF' fes_blocks_* | awk '{print $4}' > deltaF.dat
grep 'weights' fes_blocks_* | awk '{print $4}' > weights.dat
awk '{sum = 0; for (i = 1; i <= NF; i++) sum = $i; sum /= 4.184; print sum}' deltaF.dat > deltaFkcal.dat;
paste deltaFkcal.dat weights.dat > deltaFall.dat  
awk '{for(i=1;i<=NF;i++) {sum[i] += $i; sumsq[i] += ($i)^2}} 
    END {for (i=1;i<=NF;i++) {printf "%f %f \n", sum[i]/(NR*4.184), sqrt((sumsq[i]-sum[i]^2/NR)/(NR*4.184))}}' deltaF.dat >> deltaFstdv.dat


