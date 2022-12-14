-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3307
-- 生成日期： 2022-07-28 04:27:39
-- 服务器版本： 10.4.24-MariaDB
-- PHP 版本： 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `vue-ego`
--

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE `category` (
  `id` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `cid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`id`, `name`, `cid`) VALUES
(1, '家用电器', 1001),
(1, '手机/运营商/数码', 1002),
(1, '电脑/办公', 1003),
(1, '家具/家居', 1004),
(1001, '电视', 10001),
(1001, '空调', 10002),
(1001, '洗衣机', 10003),
(1001, '冰箱', 10004),
(1002, '手机通讯', 10001),
(1002, '运营商', 10002),
(1002, '摄影', 10003),
(1002, '摄像', 10004),
(1003, '电脑整机', 10001),
(1003, '电脑配件', 10002),
(1003, '外设产品', 10003),
(1003, '游戏设备', 10004),
(1004, '厨具', 10001),
(1004, '家纺', 10002),
(1004, '灯具', 10003),
(1004, '家具', 10004),
(10001, '超薄点视', 100001),
(10001, '全面屏点视', 100002);

-- --------------------------------------------------------

--
-- 表的结构 `content`
--

CREATE TABLE `content` (
  `id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `content`
--

INSERT INTO `content` (`id`, `name`, `pid`) VALUES
(1, '广告分类', 1001),
(1001, 'banner广告', 10001),
(1001, '直播代购', 10002),
(1001, '电子产品广告', 10003),
(19412, '刚刚赚了很多钱', 89602),
(1001, '京东618', 90410),
(90410, '电脑', 56320),
(1001, '2020京东618', 593143);

-- --------------------------------------------------------

--
-- 表的结构 `contentinfo`
--

CREATE TABLE `contentinfo` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` text NOT NULL,
  `url` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `contentinfo`
--

INSERT INTO `contentinfo` (`id`, `pid`, `name`, `url`, `image`) VALUES
(1, 10001, 'OPPO Watch', 'https://pro.jd.com/mall/active/tG3nBBhghqhfM69HoJw9ZoDaT7d/index.html?extension_id=eyJhZCI6IiIsImNoIjoiIiwic2hvcCI6IiIsInNrdSI6IiIsInRzIjoiIiwidW5pcWlkIjoie1wiY2xpY2tfaWRcIjpcIjg5YzRjMTUyLWUwZjktNGQ0OC05NDI4LTJhODQ4NWJjNTc1N1wiLFwibWF0ZXJpYWxfaWRcIjpcIjE4NTAxMDcyMjlcIixcInBvc19pZFwiOlwiNDI3MlwiLFwic2lkXCI6XCJmODcwZmM2MS1jYjc3LTQwN2UtOTM1ZC1jYzhlZTc0MTYyZTdcIn0ifQ==&jd_pop=89c4c152-e0f9-4d48-9428-2a8485bc5757&abt=1', '//img14.360buyimg.com/pop/s1180x940_jfs/t1/110562/14/10737/42247/5e81bb76E6fffa006/b3f703f750bd37ea.jpg.webp'),
(3, 90410, '椅子', 'https://channel-m.jd.com/pc/psp/10979325649?imup=CgwKBnd3dGxpdRIAGAASEAjR7azzKBDmZhoAIJpNKAEYsRsgACoUaWwsdWEseGdiLGdhLGNpYSxiYWEyAmlsOioKCWpkX2hiZHl5MRDnYRgCIJL50ty1x-S1dyjCo6Q3MMGjpDc4E0CAgCA&extension_id=eyJhZCI6IiIsImNoIjoiIiwic2hvcCI6IiIsInNrdSI6IiIsInRzIjoiIiwidW5pcWlkIjoie1wiY2xpY2tfaWRcIjpcIjJiNmEyNjE5LWE4MmItNGMyNi1iYzYwLWI3ZGE1NzljOWRkZVwiLFwibWF0ZXJpYWxfaWRcIjpcIjg2MDUxMzIyOTY2NTg2NjQ1OTRcIixcInBvc19pZFwiOlwiMzUwNVwiLFwic2lkXCI6XCJmN2Y5ODM2ZS0yZTViLTQyMTUtYWNiMi04NDdmZmI2N2U2ZDdcIn0ifQ==&jd_pop=2b6a2619-a82b-4c26-bc60-b7da579c9dde&abt=0', 'https://img12.360buyimg.com/pop/s1180x940_jfs/t1/117573/18/9029/83238/5ed7c92aE789977c2/b11a288a7284cdfe.jpg.webp');

-- --------------------------------------------------------

--
-- 表的结构 `params`
--

CREATE TABLE `params` (
  `id` int(11) NOT NULL,
  `itemCatId` text NOT NULL,
  `paramData` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `params`
--

INSERT INTO `params` (`id`, `itemCatId`, `paramData`) VALUES
(10005, '10001', '[{\"value\":\"品牌\",\"children\":[{\"childValue\":\"戴尔\",\"value\":\"\"},{\"childValue\":\"宏碁\",\"value\":\"\"},{\"childValue\":\"mac\",\"value\":\"\"},{\"childValue\":\"小米\",\"value\":\"\"}]},{\"value\":\"内存\",\"children\":[{\"value\":\"\",\"childValue\":\"256\"},{\"childValue\":\"固态\",\"value\":\"\"}]}]'),
(10008, '1002', '[{\"value\":\"主题\",\"children\":[{\"childValue\":\"好看\",\"value\":\"\"}]},{\"value\":\"时么\",\"children\":[{\"value\":\"\",\"children\":[],\"childValue\":\"时的1\"},{\"childValue\":\"是的2\",\"value\":\"\"}]}]'),
(10009, '10002', '[{\"value\":\"空调\",\"children\":[{\"childValue\":\"123\",\"value\":\"\"},{\"childValue\":\"123\",\"value\":\"\"}]}]'),
(10010, '10002', '[{\"value\":\"电脑\",\"children\":[{\"childValue\":\"网线\",\"value\":\"\"},{\"childValue\":\"接口\",\"value\":\"\"}]},{\"value\":\"鼠标\",\"children\":[{\"childValue\":\"有限\",\"value\":\"\"}]}]');

-- --------------------------------------------------------

--
-- 表的结构 `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `type` text NOT NULL,
  `image` text NOT NULL,
  `sellPoint` text NOT NULL,
  `price` text NOT NULL,
  `cid` text NOT NULL,
  `num` text NOT NULL,
  `status` text NOT NULL,
  `descs` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `project`
--

INSERT INTO `project` (`id`, `title`, `type`, `image`, `sellPoint`, `price`, `cid`, `num`, `status`, `descs`) VALUES
(10015, '三体-刘慈欣', '', '', '未来科幻', '99', '', '999', '', '<p>这是大刘的得意之作，连奥巴马都喜欢看！</p>'),
(10028, '梦里花落知多少', '', '2.jpg', '小时代！！！', '11', '10001', '11', '', '<p>还不错，但是要看书籍，不要看电影</p>'),
(10031, '我与地坛', '', '', '做一个不动声色的人', '55', '', '464', '', '人生尔尔，错过了，就是一辈子'),
(10032, '舞！舞！舞！', '', '', '村上春树经典作品', '234', '43', '34', '', '人不是慢慢变老的，而是一瞬间变老的'),
(10033, '岁月神偷', '', '', '经典书籍', '23', '', '23', '', '我没有精力去认识一个新的人，或者花力气去宠福新维系一段感情，跟没办法在把自己的故事讲述一遍又一遍'),
(10035, '解忧杂货店', '', '', '无论现在有多么的不开心，你要相信明天会比今天更好', '34', '', '12', '', '<p>无论现在有多么的不开心，你要相信明天会比今天更好!!!!</p>'),
(10038, '小王子', '', '', '写给成年人的童话故事', '20', '', '1', '1', '所有人都曾是小孩，虽然之后少数人记得'),
(10039, '笑场', '', 'mock\\upload\\1585277506405-u=2137641711,889921437&fm=26&gp=0.jpg', '李诞的作品，很有意思，集成了扯经', '55', '100002', '1000', '1', '<p>未曾开言，我先笑场，笑过之后，听我来诉一诉衷肠</p>'),
(10040, '万历十五年', '', 'mock\\upload\\1585277681739-u=2137641711,889921437&fm=26&gp=0.jpg', '人民的名义里面出现过很多次', '45', '10002', '26', '1', '<p>在明朝当皇帝其实没那么幸福，比其清朝来说，还是清朝的皇帝牛逼，毕竟清朝才是更加牛逼的中央集权制</p>'),
(10041, '万寿寺【王小波】', '', 'http://localhost:3000\\1654419823594-55a4ecd46bd6afbf5291b1677f4573d0.jpeg', '非常好看', '30', '', '300', '1', '<p>值得去看一看</p>'),
(10042, '【精】梁羽生闲说金瓶梅', '', 'mock\\upload\\1591151966753-u=2534506313,1688529724&fm=26&gp=0.jpg', '好看', '33', '10002', '55', '1', '<p>非常好看</p>'),
(10043, '绿皮书', '', 'http://localhost:3000\\1654183921813-1.jpeg', '不同于其他类型的影片，容易在视觉上带来冲击，或是使人感觉热血沸腾，剧情片的节奏比较缓慢，但是情节紧凑，一般更倾向在情感上引起共鸣', '10', '10003', '2', '1', '<p>该片改编自真人真事，讲述了保镖托尼被聘用为世界上优秀的古典钢琴家唐开车。钢琴家将从纽约开始举办巡回演奏，俩人之间一段跨越种族、阶级的友谊的故事<br/></p>'),
(10044, 'Rog显卡3060', '电脑配件', 'http://localhost:3000\\1654184683331-3.jpeg', '满足发烧友对极致性能和极致外观的需求', '5000', '10002', '5', '1', '<p><a target=\"_blank\" href=\"https://baike.baidu.com/item/ROG%E7%8E%A9%E5%AE%B6%E5%9B%BD%E5%BA%A6/6243619\">ROG玩家国度</a>秉承只为超越的精神，以玩家体验为根本出发点，近年来不断推出令人惊叹的理念和创意，不断创造出为玩家量身订制的设计和功能，用最顶级的PC解决方案满足各种极限应用的需求，并不断打破各项世界纪录，在全球范围内得到无限赞誉，成为冠军之选。<br/></p>'),
(10048, '内存条8g', '10002', 'http://localhost:3000\\1654702857364-99aaa5b1d4a974ad7b40b1d385762a5b.jpeg', '大运存', '5000', '', '50', '1', '<p>在运行的时候永远达不到我所希望的速度，在我换了一个8GB的内存条之后使用效率显著提高，我才知道了内存条的重要性。所以这次为自己打造电脑主机时我一定要对内存条进行慎重选择。<br/></p>');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES
(1, 'iwen', '123', 'iwen@iwenwiki.com'),
(9, 'lps', 'lps', 'hello@qq.com'),
(10, 'Abner', 'Abner', '2000@qq.com'),
(11, 'lps', 'lps', 'lps@qq.com'),
(12, '111', '111', '111@qq.com'),
(13, 'sss', '123', '123@qq.com');

--
-- 转储表的索引
--

--
-- 表的索引 `contentinfo`
--
ALTER TABLE `contentinfo`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `params`
--
ALTER TABLE `params`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `contentinfo`
--
ALTER TABLE `contentinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `params`
--
ALTER TABLE `params`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10011;

--
-- 使用表AUTO_INCREMENT `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10049;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
