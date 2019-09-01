class Man{
  const Man({
    this.title,
    this.name,
    this.url
});
  final String title;
  final String name;
  final String url;
}

 final List<Man> posts = [
   Man(
     title: "厨师",
     name: "张三",
     url: "http://pic25.nipic.com/20121112/9252150_150552938000_2.jpg"
   ),
   Man(
     title: "记者",
     name: "李四",
     url: "http://pic16.nipic.com/20111006/6239936_092702973000_2.jpg"
   ),
   Man(
     title: "球员",
     name: "王五",
     url: "http://pic1.win4000.com/wallpaper/c/53cdd1f7c1f21.jpg"
   ),
   Man(
     title: "吃货",
     name: "李六",
     url: "http://pic23.nipic.com/20120908/6771328_143623427120_2.jpg"
   ),
   Man(
     title: "经历",
     name: "七七",
     url: "http://pic23.nipic.com/20120908/6771328_143623427120_2.jpg"
   )
 ];