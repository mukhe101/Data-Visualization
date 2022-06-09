```{r}
#load libraries
library(tidyverse)
library(janitor)
library(showtext)
library(ggdist)
library(RColorBrewer)
```

```{r}
#load data
df <-  read.csv("C:/Users/smukherjee/Desktop/Offline Documents/Portfolio/SUD/all-admissions_0.csv") 
df$percent <-df$percent*100
```

```{r}
#formatting
font <- "Roboto"
font_add_google(family=font, font)
theme_set(theme_minimal(base_family = font))
back <- "#EDEADE"
lines <- "#2E321F"
color_group <- c("#0F4C5C", "#9A031E", "#5F0F40")
showtext_auto(enable = TRUE)
```

```{r}
#plot
ggplot(data=df, aes(x=year, y=percent, color=substance)) +
  geom_line(size=1)+
  geom_point(data=df,
            size=3)+
  geom_text(data=df%>% filter(year==2017), 
            aes(x=year,
                y=percent,
                label=substance, 
                color=substance),
            hjust=1,
            vjust=-1.5,
            size=6,
            family=font,
            fontface="bold")+
  scale_x_continuous(breaks = seq(2008,2017,1)) +
  scale_y_continuous(limits = c(0,100), expand = c(0,0)) +
scale_color_manual(values = color_group) +
  labs(
            title="Substance Use Trends in Massachusetts",
            subtitle='Since 2008, patients report using opioids more than any other substance.',
            y='Percent of Admissions',
            caption='Data: MA Department of Public Health \nBureau of Substance Addiction Treatment Services')+
  theme(

    panel.grid = element_blank(),
    axis.text = element_text(color=lines, size=9),
    axis.title.x  = element_blank(),
    axis.line = element_line(),
    plot.title = element_text(hjust=0,size=20, color=lines,lineheight=.8, face="bold", margin=margin(0,0,10,0)),
    plot.subtitle = element_text(hjust=0,size=12, color=lines, margin=margin(0,0,20,0)),
    plot.caption = element_text(hjust=0, margin=margin(20,0,0,0), size=10, color=lines),
    plot.title.position = "plot",
    plot.background = element_rect(color=back, fill=back),
    plot.margin = margin(30,30,30,30),
    legend.position = "none")
```

```{r}
#save as square image
showtext_opts(dpi = 320)
ggsave("SubsuseMA.png",
       height = 7,
       width = 7,
       dpi=320,
       
)  

showtext_auto(FALSE) 
```
