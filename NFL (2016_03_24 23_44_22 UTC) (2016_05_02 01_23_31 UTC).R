
# load XML package

library(XML)

url0 <- "http://www.nfl.com/stats/player"

url1 <- "http://www.nfl.com/stats/categorystats?tabSeq=0&season=2012&seasonType=PRE&d-447263-n=1&d-447263-o=2&conference=null&statisticCategory=PASSING&d-447263-p=1&d-447263-s=PASSING_YARDS"

url2 <- "http://www.nfl.com/stats/categorystats?tabSeq=0&season=2012&seasonType=PRE&d-447263-n=1&d-447263-o=2&conference=null&statisticCategory=PASSING&d-447263-p=2&d-447263-s=PASSING_YARDS"

url3 <- "http://www.nfl.com/stats/categorystats?tabSeq=0&season=2012&seasonType=PRE&d-447263-n=1&d-447263-o=2&conference=null&statisticCategory=PASSING&d-447263-p=3&d-447263-s=PASSING_YARDS"

table1 <- readHTMLTable(url1, which = 1, stringsAsFactors = F)
head(table1)

table2 <- readHTMLTable(url2, which = 1, stringsAsFactors = F)

table3 <- readHTMLTable(url3, which = 1, stringsAsFactors = F)

nfl_data <- rbind(table1, table2, table3)

names(nfl_data)

# Clean the column names

library(stringr)

names(nfl_data) <- str_replace_all(names(nfl_data), "\n", "")

names(nfl_data)

str(nfl_data)

# change the types of variables

classes <- c("numeric", "character", "character", "factor", rep("numeric", 16))
classes

table1 <- readHTMLTable(url1, which = 1, stringsAsFactors = F, colClasses = classes)
head(table1)

table2 <- readHTMLTable(url2, which = 1, stringsAsFactors = F, colClasses = classes)

table3 <- readHTMLTable(url3, which = 1, stringsAsFactors = F, colClasses = classes)

nfl_data <- rbind(table1, table2, table3)

names(nfl_data)

# Clean the column names

library(stringr)

names(nfl_data) <- str_replace_all(names(nfl_data), "\n", "")

names(nfl_data)

str(nfl_data)

# plot a dotplot showing the top 15 players by rating
nrow(nfl_data)
top15 <- subset(nfl_data, rank(Rate) > (nrow(nfl_data)-15))

ggplot(top15, aes(x = Rate, y = reorder(Player, Rate))) + geom_point(size = 3) +
        xlab("Rating") + ylab("Player") + theme_update()

