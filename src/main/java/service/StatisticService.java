package service;

import java.util.List;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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

}
