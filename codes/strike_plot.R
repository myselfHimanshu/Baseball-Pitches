#pitch speed visualization
x <- c(-.95,.95,.95,-.95,-.95)
z <- c(1.6,1.6,3.5,3.5,1.6)

sz <- data_frame(x,z) 

ggplot()+
  geom_path(data = sz, aes(x=x, y=z))+
  coord_equal()+
  xlab("feet from home plate")+
  ylab("feet above the ground")+
  geom_point(data = nh,aes(x=px,y=pz,size=start_speed))+
  scale_size(range = c(0.01,3))