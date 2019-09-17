

### SOO
# ids <- read.table("/Users/afaisst/Work/TMP/forSOO_MMT/Lyahalo/cat/zcosmosdeep_v2.6_zsel_magsel_photov9b_forSOO_IB_with1Dspec.dat",header=TRUE)
# id.key <- "id"
# output.dir <- "delivery_Soo"
# filetype <- "2d"

# CIVANO
# ids <- read.table("/Users/afaisst/Work/TMP/forCIVANO/agns/chandra_cosmos_legacy_w_zDEEP_id.dat",header=TRUE)
# id.key <- "ORI_ID"
# output.dir <- "delivery_Civano"
# filetype <- "1d"

## For Steve Finkelstein
ids <- read.table("/Users/afaisst/Work/TMP/forSteveF/zCOSMOSdeepspectra/zcosmosdetections.txt",header=TRUE)
id.key <- "ID"
output.dir <- "delivery_Finkelstein"
filetype <- "1d"



spec.found <- 0
spec.notfound <- 0

for (ii in 1:dim(ids)[1]){
	id <- ids[ii,id.key]

	if (filetype == "2d"){
		tmp <- system(sprintf("ls LB*/2DFiles/*%g*.fits",id),intern=TRUE)
	}
	if (filetype == "1d"){
		tmp <- system(sprintf("ls LB*/1DFiles/*%g*.fits",id),intern=TRUE)
	}
	
	if (length(tmp) > 0){
		print(tmp)
		
		for (jj in 1:length(tmp)){
			cmd <- sprintf("cp %s %s/",tmp[jj],output.dir)
			system(cmd)
			print(cmd)
		}
		
		spec.found <- spec.found + 1
		
	} else {
		print("no spec found")
		
		spec.notfound <- spec.notfound + 1
		
	}

print("----")

}

cat("---- SUMMARY ----\n")
cat(sprintf("spectra found: %g\n",spec.found))
cat(sprintf("missing spectra: %g\n",spec.notfound))
cat("------------------")
