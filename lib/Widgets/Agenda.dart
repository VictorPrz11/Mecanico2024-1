import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Mecanico/Datos/meeting.dart';
import 'package:Mecanico/Screens/Crear_Cita.dart';
import 'package:Mecanico/Screens/EdicioCita.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Agenda extends StatefulWidget {
  Agenda({
    super.key,
  });

  @override
  State<Agenda> createState() => _AgendaState();
}

final datos = fecha.selectedDate.toString();
final CalendarController fecha = CalendarController();
//List<Meeting> meetings = [];

class _AgendaState extends State<Agenda> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Container(
          height: 500,
          child: SfCalendar(
            appointmentBuilder: (context, CalendarAppointmentDetails details) {
              return clickCita(
                details.appointments.first,
              );
            },
            todayHighlightColor: Colors.blueGrey,
            headerHeight: 50,
            showDatePickerButton: true,
            controller: fecha,
            backgroundColor: Colors.grey.shade900,
            cellBorderColor: HexColor('F2F2F2'),
            view: CalendarView.month,
            showNavigationArrow: true,
            dataSource: MeetingDataSource(_getDataSource()),
            viewHeaderStyle: ViewHeaderStyle(
              dayTextStyle: TextStyle(color: Colors.white),
            ),
            headerStyle: CalendarHeaderStyle(
                textStyle: TextStyle(color: Colors.white, fontSize: 20)),
            monthViewSettings: MonthViewSettings(
                showAgenda: true,
                agendaItemHeight: 120,
                agendaStyle: AgendaStyle(
                    backgroundColor: Colors.blueGrey,
                    appointmentTextStyle: GoogleFonts.montserrat(
                        fontSize: 15, fontWeight: FontWeight.w500),
                    dateTextStyle: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    dayTextStyle: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15)),
                monthCellStyle:
                    MonthCellStyle(textStyle: TextStyle(color: Colors.white))),
          ),
        ));
  }

  List<Cita> _getDataSource() {
    final meetingsBox = Hive.box<Cita>('citas');
    final meetings = meetingsBox.values.toList();
    return meetings;
  }

  Widget clickCita(Cita appointment) {
    var encontrado = buscar(appointment);

    return Container(
        height: 100,
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        decoration: BoxDecoration(
          color: HexColor('#dee1ec'),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                height: 200,
                width: 150,
                child: ListView(
                  children: [
                    Text(
                      'DATOS DE LA CITA\nNombre: ' +
                          appointment.nombre +
                          '\nRazon: ' +
                          appointment.razon +
                          '\nTelefono: ' +
                          appointment.telefono,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: HexColor('000000'),
                      ),
                    ),
                  ],
                )),
            Container(
              width: 50,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return dialogConfirmacion(appointment);
                          },
                        );
                      },
                      icon: Icon(Icons.delete, color: Colors.black, size: 30)),
                ],
              ),
            )
          ],
        ));
  }

  Widget dialogConfirmacion(cita) {
    return Dialog(
      child: //Padding(
          //   padding: const EdgeInsets.all(8.0),
          Container(
              height: 80,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          eliminarCita(cita).then((value) => {actualizar()});
                        },
                        child: Center(
                          child: const Text(
                            'Eliminar Cita',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                        )),
                  ),
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: const Text(
                            'Cancelar',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          ),
                        )),
                  ),
                ],
              )),
    );
  }

  void actualizar() {
    setState(() {});
  }

  int buscar(Cita appointment) {
    var box = Hive.box<Cita>('citas');
    var cita = appointment;
    int encontrado = 0;
    for (int i = 0; i < box.length; i++) {
      if (cita == box.getAt(i)) {
        encontrado = i;
      }
    }
    return encontrado;
  }

  Future<void> eliminarCita(Cita appointment) async {
    var box = await Hive.box<Cita>('citas');
    var cita = appointment;
    for (int i = 0; i < box.length; i++) {
      if (cita == box.getAt(i)) {
        await box.deleteAt(i);
        Navigator.of(context).pop();
      }
    }
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Cita> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).startTime;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).nombre;
  }

  @override
  Color getColor(int index) {
    return Colors.blue;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).funcion;
  }

  Cita _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Cita meetingData;
    if (meeting is Cita) {
      meetingData = meeting;
    }

    return meetingData;
  }
}
