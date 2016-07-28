#pitch type visualization
#Manual Color Specification
#Faceting with one variable
#by num

ggplot()+
  geom_path(data = sz, aes(x=x, y=z))+
  coord_equal()+
  xlab("feet from home plate")+
  ylab("feet above the ground")+
  geom_point(data = nh,aes(x=px,y=pz,size=start_speed, color=pitch_desc))+
  scale_size(range = c(0.005,2.5))+
  scale_color_manual(values = c('green','blue','yellow','red','black'))+
  facet_wrap(~num)+
  geom_text(data = nh,aes(label=stand, x = stand_xcoord),y=2.5,size=4)+
  geom_text(data = nh,aes(label=batter_name),x=0,y=0.5,size=2.5)+
  geom_text(data = nh,aes(label=inning.x),x=0,y=4.5,size=2.2)
  


