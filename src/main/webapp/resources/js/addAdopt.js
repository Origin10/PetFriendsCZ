function changeForm(checked) {
    if (checked == 1) {
        $("#localtionChange").text("*走失地點：");
        $("#DateChange").text("*走失日期：");
    }
    if (checked == 2 || checked == 3) {
        $("#localtionChange").text("*拾獲地點：");
        $("#DateChange").text("*拾獲日期：");
    }
    if (checked == 4) {
        $("#localtionChange").text("*寵物現在地點：");
        $("#DateChange").text("*養育時間(從)：");
    }
}

function clearForm() {
	$("#PetType").val('');
	$("#FindCity").val('');
	$("#FindDistrict").empty();
	$("#PetGender").val('');
    $("span").text("");
    $("input:text").val("");
    $("#date").val("");
    $("input:file").val("");
    $("#PetNotes").text("");
}

function TestForm() {
	$("#UserTitle").val('幫忙尋找我家的黃金獵犬');
	$("#UserName").val('東方不敗');
	$("#UserPhone").val('0989630454')
	$("#PetType").val('狗狗');
	$("#FindCity").val('台北市');
	$("#PetFeature").val('牠是個很大一隻的黃金獵犬，年齡約5歲，右腳有個包紮過的痕跡')
	$("#PetNotes").text('帶牠去復興南路那邊散步的時候失蹤的，找了很久都找不到。')
	setFindDistrict('台北市');
	$("#PetGender").val('男性');
	$("input:file").val("");
	$("#FindDate").datepicker("setDate","2017/06/08");
}

function setCity() {
    var CityArrays = ["台北市", "新北市", "桃園市", "台中市", "台南市", "高雄市", "基隆市", "新竹市",
        "嘉義市", "新竹縣", "苗栗縣", "彰化縣", "南投縣", "雲林縣", "嘉義縣", "屏東縣", "宜蘭縣",
        "花蓮縣", "臺東縣", "澎湖縣"
    ];
    $.each(CityArrays, function(index, value) {
        $("#FindCity").append(
            $("<option></option>").attr("value", value).text(value));
    });
}

function setFindDistrict(selectedCity) {
	//設定初值
    var DistrictArrays = [];
    //設定地區陣列
	var Taipei = ["中正區", "大同區", "中山區", "松山區", "大安區", "萬華區", "信義區", "士林區",
        "北投區", "內湖區", "南港區", "文山區"
    ];
    var NewTaipei = ["板橋區", "新莊區", "中和區", "永和區", "土城區", "樹林區", "三峽區", "鶯歌區",
        "三重區", "蘆洲區", "五股區", "泰山區", "林口區", "八里區", "淡水區", "三芝區", "石門區",
        "金山區", "萬里區", "汐止區", "瑞芳區", "貢寮區", "平溪區", "雙溪區", "新店區", "深坑區",
        "石碇區", "坪林區", "烏來區"
    ];
    var Taoyuan = ["桃園區", "中壢區", "平鎮區", "八德區", "楊梅區", "蘆竹區", "大溪區", "龍潭區",
        "龜山區", "大園區", "觀音區", "新屋區", "復興區"
    ]
    var Taichung = ["中區", "東區", "南區", "西區", "北區", "北屯區", "西屯區", "南屯區", "太平區",
        "大里區", "霧峰區", "烏日區", "豐原區", "后里區", "石岡區", "東勢區", "新社區", "潭子區",
        "大雅區", "神岡區", "大肚區", "沙鹿區", "龍井區", "梧棲區", "清水區", "大甲區", "外埔區",
        "大安區", "和平區"
    ]
    var Tainan = ["中西區", "東區", "南區", "北區", "安平區", "安南區", "永康區", "歸仁區", "新化區",
        "左鎮區", "玉井區", "楠西區", "南化區", "仁德區", "關廟區", "龍崎區", "官田區", "麻豆區",
        "佳里區", "西港區", "七股區", "將軍區", "學甲區", "北門區", "新營區", "後壁區", "白河區",
        "東山區", "六甲區", "下營區", "柳營區", "鹽水區", "善化區", "大內區", "山上區", "新市區",
        "安定區"
    ];
    var Kaohsiung = ["楠梓區", "左營區", "鼓山區", "三民區", "鹽埕區", "前金區", "新興區", "苓雅區",
        "前鎮區", "旗津區", "小港區", "鳳山區", "大寮區", "鳥松區", "林園區", "仁武區", "大樹區",
        "大社區", "岡山區", "路竹區", "橋頭區", "梓官區", "彌陀區", "永安區", "燕巢區", "田寮區",
        "阿蓮區", "茄萣區", "湖內區", "旗山區", "美濃區", "內門區", "杉林區", "甲仙區", "六龜區",
        "茂林區", "桃源區", "那瑪夏區"
    ];
    var Keelung = ["仁愛區", "中正區", "信義區", "中山區", "安樂區", "暖暖區", "七堵區"];
    var Hsinchu = ["東區", "北區", "香山區"];
    var Chiayi = ["東區", "西區"];
    var HsinchuCounty = ["竹北市", "竹東鎮", "新埔鎮", "關西鎮", "湖口鄉", "新豐鄉", "峨眉鄉",
        "寶山鄉", "北埔鄉", "芎林鄉", "橫山鄉", "尖石鄉", "五峰鄉"
    ];
    var Miaoli = ["苗栗市", "頭份市", "竹南鎮", "後龍鎮", "通霄鎮", "苑裡鎮", "卓蘭鎮", "造橋鄉",
        "西湖鄉", "頭屋鄉", "公館鄉", "銅鑼鄉", "三義鄉", "大湖鄉", "獅潭鄉", "三灣鄉", "南庄鄉",
        "泰安鄉"
    ];
    var Changhua = ["彰化市", "員林市", "和美鎮", "鹿港鎮", "溪湖鎮", "二林鎮", "田中鎮", "北斗鎮",
        "花壇鄉", "芬園鄉", "大村鄉", "永靖鄉", "伸港鄉", "線西鄉", "福興鄉", "秀水鄉", "埔心鄉",
        "埔鹽鄉", "大城鄉", "芳苑鄉", "竹塘鄉", "社頭鄉", "二水鄉", "田尾鄉", "埤頭鄉", "溪州鄉"
    ];
    var Nantou = ["南投市", "埔里鎮", "草屯鎮", "竹山鎮", "集集鎮", "名間鄉", "鹿谷鄉", "中寮鄉",
        "魚池鄉", "國姓鄉", "水里鄉", "信義鄉", "仁愛鄉"
    ];
    var Yunlin = ["斗六市", "斗南鎮", "林內鄉", "古坑鄉", "大埤鄉", "莿桐鄉", "虎尾鎮", "西螺鎮",
        "土庫鎮", "褒忠鄉", "二崙鄉", "崙背鄉", "麥寮鄉", "臺西鄉", "東勢鄉", "北港鎮", "元長鄉",
        "四湖鄉", "口湖鄉", "水林鄉"
    ];
    var ChiayiCounty = ["太保市", "布袋鎮", "大林鎮", "民雄鄉", "溪口鄉", "新港鄉", "六腳鄉",
        "東石鄉", "義竹鄉", "鹿草鄉", "水上鄉", "中埔鄉", "竹崎鄉", "梅山鄉", "番路鄉", "大埔鄉",
        "阿里山鄉"
    ];
    var Pingtung = ["屏東市", "潮州鎮", "東港鎮", "恆春鎮", "萬丹鄉", "崁頂鄉", "新園鄉", "林邊鄉",
        "南州鄉", "琉球鄉", "枋寮鄉", "枋山鄉", "車城鄉", "滿州鄉", "高樹鄉", "九如鄉", "鹽埔鄉",
        "里港鄉", "內埔鄉", "竹田鄉", "長治鄉", "麟洛鄉", "萬巒鄉", "新埤鄉", "佳冬鄉", "霧台鄉",
        "泰武鄉", "瑪家鄉", "來義鄉", "春日鄉", "獅子鄉", "牡丹鄉", "三地門鄉"
    ];
    var Yilan = ["宜蘭市", "頭城鎮", "礁溪鄉", "壯圍鄉", "員山鄉", "羅東鎮", "蘇澳鎮", "五結鄉",
        "三星鄉", "冬山鄉", "大同鄉", "南澳鄉"
    ];
    var Hualien = ["花蓮市", "鳳林鎮", "玉里鎮", "新城鄉", "吉安鄉", "壽豐鄉", "光復鄉", "豐濱鄉",
        "瑞穗鄉", "富里鄉", "秀林鄉", "萬榮鄉", "卓溪鄉"
    ];
    var Taitung = ["臺東市", "成功鎮", "關山鎮", "長濱鄉", "池上鄉", "東河鄉", "鹿野鄉", "卑南鄉",
        "大武鄉", "綠島鄉", "太麻里鄉", "海端鄉", "延平鄉", "金峰鄉", "達仁鄉", "蘭嶼鄉"
    ];
    var Penghu = ["馬公市", "湖西鄉", "白沙鄉", "西嶼鄉", "望安鄉", "七美鄉"];
    //給值
    switch (selectedCity) {
        case "台北市":
            DistrictArrays = Taipei;
            break;
        case "新北市":
            DistrictArrays = NewTaipei;
            break;
        case "桃園市":
            DistrictArrays = Taoyuan;
            break;
        case "台中市":
            DistrictArrays = Taichung;
            break;
        case "台南市":
            DistrictArrays = Tainan;
            break;

        case "高雄市":
            DistrictArrays = Kaohsiung;
            break;

        case "基隆市":
            DistrictArrays = Keelung;
            break;

        case "新竹市":
            DistrictArrays = Hsinchu;
            break;

        case "嘉義市":
            DistrictArrays = Chiayi;
            break;

        case "新竹縣":
            DistrictArrays = HsinchuCounty;
            break;

        case "苗栗縣":
            DistrictArrays = Miaoli;
            break;

        case "彰化縣":
            DistrictArrays = Changhua;
            break;

        case "南投縣":
            DistrictArrays = Nantou;
            break;

        case "雲林縣":
            DistrictArrays = Yunlin;
            break;

        case "嘉義縣":
            DistrictArrays = ChiayiCounty;
            break;

        case "屏東縣":
            DistrictArrays = Pingtung;
            break;

        case "宜蘭縣":
            DistrictArrays = Yilan;
            break;

        case "花蓮縣":
            DistrictArrays = Hualien;
            break;

        case "臺東縣":
            DistrictArrays = Taitung;
            break;

        case "澎湖縣":
            DistrictArrays = Penghu;
            break;
        default:
        	$("#FindDistrict").empty();
    }
    $("#FindDistrict").empty();
    $.each(DistrictArrays, function(index, value) {
        $("#FindDistrict").append(
            $("<option></option>").attr("value", value).text(value));
    });
}
