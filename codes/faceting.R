#pitch type visualization
#Manual Color Specification
#Faceting with one variable
#Seprate Right and Left Handed

stand_xcoord <- nh$stand
stand_xcoord[which(stand_xcoord=='L')] <- -1.5
stand_xcoord[which(stand_xcoord=='R')] <- 1.5

stand_xcoord <- as.numeric(stand_xcoord)

nh$stand_xcoord <- stand_xcoord

ggplot()+
  geom_path(data = sz, aes(x=x, y=z))+
  coord_equal()+
  xlab("feet from home plate")+
  ylab("feet above the ground")+
  geom_point(data = nh,aes(x=px,y=pz,size=start_speed, color=pitch_desc))+
  scale_size(range = c(0.005,2.5))+
  scale_color_manual(values = c('red','blue','green','yellow','black'))+
  facet_wrap(~stand)+
  geom_text(data = nh,aes(label=stand, x = stand_xcoord),y=2.5,size=6)


