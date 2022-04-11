abstract class ConversionEvent {
  const ConversionEvent();
}

class ConversionScroll extends ConversionEvent {
  //to keep the state between swipes
  const ConversionScroll();
}
