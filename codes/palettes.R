#pitch type visualization
#palettes

ggplot()+
  geom_path(data = sz, aes(x=x, y=z))+
  coord_equal()+
  xlab("feet from home plate")+
  ylab("feet above the ground")+
  geom_point(data = nh,aes(x=px,y=pz,size=start_speed, color=pitch_desc))+
  scale_size(range = c(0.005,2.5))+
  scale_color_brewer(palette = "Dark2")