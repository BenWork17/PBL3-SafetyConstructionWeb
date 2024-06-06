package service;

import java.lang.reflect.Array;

import java.time.LocalDateTime;
import java.time.Month;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.Arrays;
import java.util.HashMap;
import model.Detective;

import repository.DetectiveRepository;


public class dashboardService {
	private DetectiveRepository detectiveRepository =new DetectiveRepository();

	public List<Detective> getDetective() {
		return detectiveRepository.getDetective();
	}
	public int[] count(List<Detective> detectives) {
		int[] detections = new int[7]; // Khởi tạo mảng với 7 phần tử, mỗi phần tử là 0

        // Duyệt qua các phần tử trong danh sách detective
        for (Detective detective : detectives ) {
        	String line = detective.toString();
            int weekday = getWeekday(line);
            detections[weekday]++;
        }
		return detections;
    }

    // Hàm lấy thứ trong tuần từ chuỗi Timestamp
    private static int getWeekday(String line) {
        String timestampStr = line.split(", Timestamp=")[1].split(",")[0];
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
        LocalDateTime timestamp = LocalDateTime.parse(timestampStr, formatter);
        return timestamp.getDayOfWeek().getValue() % 7; // Chủ Nhật là 0, Thứ Hai là 1, ...
    }
    
    

    
  
    public Map<String, int[]> getMonthlyReportData(List<Detective> detectives) {
        Map<String, int[]> reportData = new HashMap<>();
        for (Detective detective : detectives) {
            String errorType = detective.getError_type();
            LocalDateTime timestamp = LocalDateTime.parse(detective.getTimestamp(), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S"));
            Month month = timestamp.getMonth();

            reportData.putIfAbsent(errorType, new int[12]);
            reportData.get(errorType)[month.getValue() - 1]++;
        }
        return reportData;
    }
   
}

