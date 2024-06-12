package service;

import java.util.List;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import model.CameraError;
import repository.CameraErrorRepository;

public class StatisticService {
	private CameraErrorRepository cameraErrorRepository = new CameraErrorRepository();

	public List<CameraError> getAlertbyTimestamp_Statistics(String Camera_name, String Date_1, String Date_2) {
		return cameraErrorRepository.getAlertbyTimestamp_Statistics(Camera_name, Date_1, Date_2);
	}

	public static String convertDateFormat(String dateString) {
		DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate date = LocalDate.parse(dateString, inputFormatter);
		DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formattedDate = date.format(outputFormatter);
		return formattedDate;
	}

	public static int[] countByWeekday(List<CameraError> cameraErrors) {
		int[] counts = new int[7]; // Khởi tạo mảng với 7 phần tử, mỗi phần tử là 0

		// Duyệt qua các phần tử trong danh sách cameraErrors
		for (CameraError cameraError : cameraErrors) {
			String line = cameraError.toString();
			int weekday = getWeekday(line);
			counts[weekday]++;
		}
		return counts;
	}

	// Hàm lấy thứ trong tuần từ chuỗi Timestamp
	private static int getWeekday(String line) {
		String timestampStr = line.split(", Timesptamp=")[1].split("]")[0];
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
		LocalDateTime timestamp = LocalDateTime.parse(timestampStr, formatter);
		return timestamp.getDayOfWeek().getValue() % 7; // Chủ Nhật là 0, Thứ Hai là 1, ...
	}

	public static Map<String, List<CameraError>> partitionByErrorType(List<CameraError> cameraErrors) {
		Map<String, List<CameraError>> partitionedMap = new HashMap<>();

		for (CameraError cameraError : cameraErrors) {
			String errorType = cameraError.getError_type();
			List<CameraError> list = partitionedMap.get(errorType);

			if (list == null) {
				list = new ArrayList<>();
				partitionedMap.put(errorType, list);
			}

			list.add(cameraError);
		}

		return partitionedMap;
	}

	public static void main(String[] args) {
		// Tạo một danh sách CameraError giả định
		List<CameraError> cameraErrors = new ArrayList<>();
		CameraErrorRepository cam = new CameraErrorRepository();

		cameraErrors = cam.getTop10CameraAndError();
		Map<String, List<CameraError>> partitionedMap = partitionByErrorType(cameraErrors);

		// Lấy ra 3 List tương ứng với mỗi error_type
		List<CameraError> list1 = partitionedMap.get("area");
		List<CameraError> list2 = partitionedMap.get("body");
		List<CameraError> list3 = partitionedMap.get("machine");
		int[] detections1 = new int[7];
		int[] detections2 = new int[7];
		int[] detections3 = new int[7];
		detections1 = StatisticService.countByWeekday(list1);
		detections2 = StatisticService.countByWeekday(list2);
		detections3 = StatisticService.countByWeekday(list3);



		// Gọi hàm countByWeekday và in kết quả
		int[] counts = countByWeekday(list1);
		for (int i = 0; i < counts.length; i++) {
		System.out.println("Số lỗi xảy ra vào ngày " +i+ ": " + counts[i]);
        int[] counts1 = countByWeekday(list2);}
        for (int j = 0; j < counts.length; j++) {
        System.out.println("Số lỗi xảy ra vào ngày "  +j+ ": " + counts[j]);

		}

		/*
		 * public Map<String, int[]> getMonthlyReportData(String cameraName, String
		 * fromDate, String toDate) { List<CameraError> errors =
		 * getAlertbyTimestamp_Statistics(cameraName, fromDate, toDate); Map<String,
		 * int[]> errorTypeCounts = new HashMap<>();
		 * 
		 * for (CameraError error : errors) { String errorType = error.getError_type();
		 * // Assuming timestamp is properly formatted String timestamp =
		 * error.getTimestamp(); // You need to ensure that `CameraError` has this field
		 * and method
		 * 
		 * String month = timestamp.substring(0, 7); // Get YYYY-MM from the timestamp
		 * errorTypeCounts.putIfAbsent(errorType, new int[12]);
		 * 
		 * int monthIndex = Integer.parseInt(timestamp.substring(5, 7)) - 1;
		 * errorTypeCounts.get(errorType)[monthIndex]++; }
		 * 
		 * return errorTypeCounts; }
		 */
	}
}

