#Specific Batter and inning

batter <- "Pedro Alvarez"
inning <- 5

#create atbat dataframe
ab <- nh%>%filter(batter_name==batter, inning.x==inning)

#labelling pitches

des <- nh$des
event <- nh$event

des[which(des=='In play, out(s)')] <- event[which(des=='In play, out(s)')]
nh$des2 <- des

ggplot()+
  geom_path(data = sz, aes(x=x, y=z))+
  coord_equal()+
  xlab("feet from home plate")+
  ylab("feet above the ground")+
  geom_point(data = ab,aes(x=px,y=pz,size=start_speed, color=pitch_desc))+
  scale_size(range = c(0.005,2.5))+
  scale_color_manual(values = c('black','blue','red','yellow','green'))+
  geom_text(data = ab,aes(label=stand, x = stand_xcoord),y=2.5,size=5)+
  xlim(-2,2)+
  ylim(0,4.5)+
  ggtitle(paste("Inning",inning," | ",batter))+
  geom_text(data = ab, aes(label=des2, x=px, y=pz),size=2.5, vjust=2)
  