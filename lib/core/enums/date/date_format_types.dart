enum DateFormatTypes {
  ddMMyyyy('dd/MM/yyyy'),
  ddMMyyyyHHmm('dd/MM/yyyy HH:mm'),
  ddMMyyyyHHmmss('dd/MM/yyyy HH:mm:ss'),
  ddMMyyyyTHHmmss('dd/MM/yyyyTHH:mm:ss'),
  HHSmm('HH : mm'),
  HHSmmAM('hh : mm aa'),
  ddMMyyyyTHHmmssAM('dd/MM/yyyyTHH:mm:ss a'),
  MMyyyy('MM/yyyy');

  const DateFormatTypes(this.format);
  final String format;
}
