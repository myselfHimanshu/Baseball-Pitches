#Counting number of pitches in an atbat

nh <- nh%>%
  arrange(tfs)

temp <- nh%>%
  group_by(num)%>%
  summarise(num_of_pitches <- n())

pitch_enum <- unlist(lapply(temp$`num_of_pitches <- n()`,seq))
nh$pitch_enum <- pitch_enum


#visualize pitch enum

#Specific Batter and inning

batter <- "Jose Tabata"
inning <- 9

#create atbat dataframe
ab <- nh%>%filter(batter_name==batter, inning.x==inning)


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
  geom_text(data = ab, aes(label=des2, x=px, y=pz),size=2.5, vjust=2)+
  geom_text(data = ab, aes(label=pitch_enum, x=px, y=pz),size=2.5, vjust=-1.2)
  
ggsave("plot.png")

