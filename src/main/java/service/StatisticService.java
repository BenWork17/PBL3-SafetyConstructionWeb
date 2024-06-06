package service;

import java.util.List;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
