#pitch type with description

pitch_desc <- nh$pitch_type
pitch_desc[which(pitch_desc=='FF')] <- "four-seam fastball"
pitch_desc[which(pitch_desc=='SL')] <- "slider"
pitch_desc[which(pitch_desc=='FC')] <- "fastball cutter"
pitch_desc[which(pitch_desc=='CU')] <- "curveball"
pitch_desc[which(pitch_desc=='CH')] <- "changeup"

nh$pitch_desc <- pitch_desc
