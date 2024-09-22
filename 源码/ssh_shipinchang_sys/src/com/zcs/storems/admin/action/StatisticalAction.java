package com.zcs.storems.admin.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Properties;

import org.apache.log4j.Logger;

import com.harmony.framework.util.properties.PropertiesUtil;
import com.harmony.framework.web.struts2.BaseGenericAction;
import com.sun.javafx.collections.MappingChange.Map;
import com.zcs.storems.admin.domain.Statistical;
import com.zcs.storems.goods.service.GoodsService;
import com.zcs.storems.instore.domain.Instore;
import com.zcs.storems.instore.service.InstoreService;
import com.zcs.storems.outstore.domain.Outstore;
import com.zcs.storems.outstore.service.OutstoreService;

import edu.emory.mathcs.backport.java.util.LinkedList;
import net.sf.json.JSONObject;

public class StatisticalAction extends BaseGenericAction<Statistical> {
	private static final long serialVersionUID = -6930243145773290898L;
	private static Properties config = PropertiesUtil.loadFromClassPathResource("/applicationGlobal.properties");
	private static Logger log = Logger.getLogger(StatisticalAction.class);

	private GoodsService goodsService;
	private InstoreService instoreService;
	private OutstoreService outstoreService;
	private String paramString;

	private Date startDate;// 统计开始时间
	private Date endDate;// 统计结束时间

	/**
	 * 统计管理首页action
	 */
	public String statisticalIndex() {
		return "success";
	}

	/**
	 * 今日盘点
	 */
	public void todayInfo() {
		log.info("今日盘点");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String todayStr = dateFormat.format(new Date());
		String todayStrStart = todayStr + " 00:00:00";
		String todayStrEnd = todayStr + " 23:59:59";
		Date todayStart = null;
		Date todayEnd = null;
		try {
			todayStart = dateFormat2.parse(todayStrStart);
			todayEnd = dateFormat2.parse(todayStrEnd);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Object[] param = new Object[] { todayStart, todayEnd };
		List<Instore> inList = this.getInList(param);
		System.out.println("in:" + inList);
		List<Outstore> outList = this.getOutList(param);
		System.out.println("out:" + outList);
		List<Object> list = new ArrayList<Object>();
		list.add(inList);
		list.add(outList);
		JSONOuter().writeList(getOut(), list);
	}

	/**
	 * 统计本月信息
	 */
	public void monthInfo() {
		log.info("统计本月");
		Calendar c = Calendar.getInstance();
		int MaxDay = c.getActualMaximum(Calendar.DAY_OF_MONTH);
		String monthHead = new SimpleDateFormat("yyyy-MM").format(new Date());
		String monthStartStr = monthHead + "-1 00:00:00";
		String monthEndStr = monthHead + "-" + MaxDay + " 23:59:59";
		Date monteStart = null;
		Date monteEnd = null;
		try {
			monteStart = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(monthStartStr);
			monteEnd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(monthEndStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Object[] param = new Object[] { monteStart, monteEnd };
		List<Instore> inList = this.getInList(param);
		System.out.println("in:" + inList);
		List<Outstore> outList = this.getOutList(param);
		System.out.println("out:" + outList);
		List<Object> list = new ArrayList<Object>();
		list.add(inList);
		list.add(outList);
		JSONOuter().writeList(getOut(), list);
	}

	/**
	 * 自定义统计
	 * 
	 * @throws ParseException
	 */
	public void rangeInfo() throws ParseException {
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		log.info("自定义统计");
		System.out.println(startDate);
		System.out.println(endDate);

		if (startDate == null) {
			startDate = sdf1.parse("1111-11-11");
		}
		if (endDate == null) {
			endDate = sdf1.parse("2222-11-11");
		} else {
			String str = sdf1.format(endDate);
			System.out.println(str);
			str += " 23:59:59";
			System.out.println(str);
			endDate = sdf2.parse(str);
		}
		Object[] param = new Object[] { startDate, endDate };
		List<Instore> inList = this.getInList(param);
		System.out.println("in:" + inList.toString());
		List<Outstore> outList = this.getOutList(param);
		System.out.println("out:" + outList.toString());
		List<Object> list = new ArrayList<Object>();
		list.add(inList);
		list.add(outList);
		JSONOuter().writeList(getOut(), list);
	}

	public void getInData() throws Exception {
		JSONObject jsonObject = new JSONObject();
		List<Instore> inList = instoreService.findAll();
		String[] months = new String[12];
		Double[] moneys = new Double[12];
		double temp = 0;
		int i = 0;
		for(String str : getLatest12Month()) {
			for(Instore instore:inList) {
				Date date = instore.getInDate();
				SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd" );
 				String idata = sdf.format(date);
				if(idata.contains(str+"")) {
					temp+=Double.parseDouble(instore.getPrice())*instore.getAmount();
				}
				//				if(instore.getInDate())
			}
			months[i] = str;
			moneys[i] = temp;

			jsonObject.put("months", months);
			jsonObject.put("moneys", moneys);

			i++;
			temp = 0;
		}
		JSONOuter().writeString(getOut(), jsonObject.toString());
	}


	public void getOutData() throws Exception {
		JSONObject jsonObject = new JSONObject();
		List<Outstore> outList = outstoreService.findAll();
		String[] months = new String[12];
		Double[] moneys = new Double[12];
		double temp = 0;
		int i = 0;
		for(String str : getLatest12Month()) {
			for(Outstore outstore:outList) {
				Date date = outstore.getOutDate();
				SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd" );
 				String odata = sdf.format(date);
				if(odata.contains(str+"")) {
					temp+=Double.parseDouble(outstore.getPrice())*outstore.getAmount();
				}
				//				if(instore.getInDate())
			}
			months[i] = str;
			moneys[i] = temp;

			jsonObject.put("months", months);
			jsonObject.put("moneys", moneys);

			i++;
			temp = 0;
		}
		JSONOuter().writeString(getOut(), jsonObject.toString());
	}

	public static List<String> getLatest12Month(){
		Date date = new Date();
		List<String> list = new ArrayList<String>();
		Calendar  from  =  Calendar.getInstance();
		from.setTime(date);
		String str1 = from.get(Calendar.YEAR)+"-"+fillZero(from.get(Calendar.MONTH)+1);
		for(int i = 11;i>=0;i--) {
			from.add(Calendar.MONTH, -i);//11个月前
			str1 = from.get(Calendar.YEAR)+"-"+fillZero(from.get(Calendar.MONTH)+1);


			from.setTime(date);
			if(str1.length() == 6) {
				str1 = str1.substring(0,5)+"0"+str1.substring(5,6);
			}
			list.add(str1);
			System.out.println(str1);
		}

		return list;
	}
	public static String fillZero(int i){
		String month = "";
		if(i<10){
			month = ""+i;
		}else{
			month = String.valueOf(i);
		}
		return month;
	}

	public static void main(String[] args) throws ParseException {
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd" );
		Date d= new Date();
		String str = sdf.format(d);
		System.out.println(str);

	}

	/**
	 * 入库列表
	 */
	private List<Instore> getInList(Object[] param) {
		return instoreService.statisticalByParam(param, "");
	}

	private List<Outstore> getOutList(Object[] param) {
		return outstoreService.statisticalByParam(param, "");
	}

	public void statisticalTest() {
		String appName = config.getProperty("app.name");
		log.info("应用程序名称:" + appName);
		log.info("测试成功!");
		JSONOuter().writeSuccessMsg(getOut(), "test success成功:" + appName);
	}

	/*--------------------- getter and setter ---------------------*/
	@Override
	public Statistical getModel() {
		return null;
	}

	public InstoreService getInstoreService() {
		return instoreService;
	}

	public void setInstoreService(InstoreService instoreService) {
		this.instoreService = instoreService;
	}

	public OutstoreService getOutstoreService() {
		return outstoreService;
	}

	public void setOutstoreService(OutstoreService outstoreService) {
		this.outstoreService = outstoreService;
	}

	public String getParamString() {
		return paramString;
	}

	public void setParamString(String paramString) {
		this.paramString = paramString;
	}

	public GoodsService getGoodsService() {
		return goodsService;
	}

	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
}
