package service;

import java.time.LocalDateTime;

import java.time.format.DateTimeFormatter;
import java.util.List;

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

        // In ra kết quả
        System.out.println("Số lần phát hiện 'Detective' theo các thứ trong tuần:");
        String[] daysOfWeek = {"Chủ Nhật", "Thứ Hai", "Thứ Ba", "Thứ Tư", "Thứ Năm", "Thứ Sáu", "Thứ Bảy"};
        for (int i = 0; i < detections.length; i++) {
            System.out.println(daysOfWeek[i] + ": " + detections[i]);
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
   
}

