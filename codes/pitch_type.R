#pitch type visualization

ggplot()+
  geom_path(data = sz, aes(x=x, y=z))+
  coord_equal()+
  xlab("feet from home plate")+
  ylab("feet above the ground")+
  geom_point(data = nh,aes(x=px,y=pz,size=start_speed, color=pitch_type))+
  scale_size(range = c(0.01,3))

#pitch type with description

pitch_desc <- nh$pitch_type
pitch_desc[which(pitch_desc=='FF')] <- "four-seam fastball"
pitch_desc[which(pitch_desc=='SL')] <- "slider"
pitch_desc[which(pitch_desc=='FC')] <- "fastball cutter"
pitch_desc[which(pitch_desc=='CU')] <- "curveball"
pitch_desc[which(pitch_desc=='CH')] <- "changeup"

nh$pitch_desc <- pitch_desc

ggplot()+
  geom_path(data = sz, aes(x=x, y=z))+
  coord_equal()+
  xlab("feet from home plate")+
  ylab("feet above the ground")+
  geom_point(data = nh,aes(x=px,y=pz,size=start_speed, color=pitch_desc))+
  scale_size(range = c(0.01,3))
