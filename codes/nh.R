library(pitchRx)
bdata <- scrape(game.ids = "gid_2015_06_20_pitmlb_wasmlb_1")
names(bdata)

atbat <- bdata$atbat
pitch <- bdata$pitch

library(dplyr)

nh <- inner_join(atbat, pitch, by = "num")%>%
      filter(inning_side.x=='top')%>%
      select(num,start_tfs,stand,event,inning.x,batter_name, des,tfs,start_speed,px,pz,pitch_type)

