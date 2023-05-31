package kr.ac.ers.dto;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberReportLsupporterVO {
	private String id;
	private String name;
	private String age;
	private String startday;
	private String endday;
	private String birth;
	private String address;
	private String phone;
	private String gender;
	private String picture;
	private String mentalstatus;
	private String fam_rel;
	private String wid;
	private String caution;
	private String pacemaker;
	private Date regDate;
	private Date equipDate;
	private String status;
	private String dropstatus;
	private String dropDate;
	private String drug;
	private String orgdisease;
	private String allergy;
	private String equipment;
	private String afNo;
	private String manId;
	private int rNo;
	private String content;
	private String reDone;
	private String viewCheck;
	private String reType;
	private int sCode;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date occurTime;
	private String occurType;
	private String callCheck;
	private String lNum;
	private int wCode;
	private String pwd;
	private String uploadpath;
	private String filename;
	private String fileType;
	private Long size;
	private List<MultipartFile> uploadFile;
	private List<ReportFileVO> reportFileList;
	public MemberReportLsupporterVO toreportVO() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public MemberReportLsupporterVO toMemberReportLsupporter() {
		MemberReportLsupporterVO memberreportlsupporter = new MemberReportLsupporterVO();
		memberreportlsupporter.setContent(this.content);
		memberreportlsupporter.setOccurTime(this.occurTime);
		memberreportlsupporter.setOccurType(this.occurType);
		memberreportlsupporter.setCallCheck(this.callCheck);
		memberreportlsupporter.setReDone(this.reDone);
		memberreportlsupporter.setRegDate(this.regDate);
		memberreportlsupporter.setReType(this.reType);
		memberreportlsupporter.setViewCheck(this.viewCheck);
		return memberreportlsupporter;
	}
	
	public void setBirth(String birth) {
		this.birth = birth;
	    Calendar now = Calendar.getInstance(); //년월일시분초
	    Integer currentYear = now.get(Calendar.YEAR);
	       
	    //태어난년도를 위한 세팅
	    String stringBirthYear = "19"+this.birth.substring(0, 2);
	    //태어난 년도
	    Integer birthYear = Integer.parseInt(stringBirthYear);

	    // 현재 년도 - 태어난 년도 => 나이 (만나이X)
	     int age = (currentYear - birthYear +1);
	     String outputAge = Integer.toString(age);
	        
	     setAge(outputAge + "세");
		
	}
	
	



}
