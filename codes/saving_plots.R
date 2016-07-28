#Counting number of pitches in an atbat

nh <- nh%>%
  arrange(tfs)

temp <- nh%>%
  group_by(num)%>%
  summarise(num_of_pitches <- n())

pitch_enum <- unlist(lapply(temp$`num_of_pitches <- n()`,seq))
nh$pitch_enum <- pitch_enum


#visualize pitch enum

colors <- c("red","blue","orange","green","purple")
names(colors) <- c('four-seam fastball','slider','fastball cutter','curveball','changeup')

#Specific Batter and inning
for(i in unique(nh$num)){

    
    #create atbat dataframe
    ab <- nh%>%filter(num==i)
    
    batter <- ab$batter_name[1]
    inning <- ab$inning.x[1]
    
    pitches <- unique(ab$pitch_desc)
    
    zmax <-(max(ab$start_speed)-75.4)/22
    zmin <-(min(ab$start_speed)-75.4)/22
    
    plot <- ggplot()+
      geom_path(data = sz, aes(x=x, y=z))+
      coord_equal()+
      xlab("feet from home plate")+
      ylab("feet above the ground")+
      geom_point(data = ab,aes(x=px,y=pz,size=start_speed, color=pitch_desc))+
      scale_size(range = c(2.495*zmin+0.005,2.495*zmax+0.005))+
      scale_color_manual(values = colors[pitches])+
      geom_text(data = ab,aes(label=stand, x = stand_xcoord),y=2.5,size=5)+
      xlim(-2,2)+
      ylim(0,5)+
      ggtitle(paste("Inning",inning," | ",batter))+
      geom_text(data = ab, aes(label=des2, x=px, y=pz),size=2.5, vjust=2)+
      geom_text(data = ab, aes(label=pitch_enum, x=px, y=pz),size=2.5, vjust=-1.2)
    
    ggsave(paste("atbat",i,".png",sep = ""), plot)
}
