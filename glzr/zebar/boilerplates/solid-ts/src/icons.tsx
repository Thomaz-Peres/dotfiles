export function getNetworkIcon(output) {
  switch (output.network.defaultInterface?.type) {
    case 'ethernet':
      return <i class="nf nf-md-ethernet_cable"></i>;
    case 'wifi':
      if (output.network.defaultGateway?.signalStrength >= 80) {
        return <i class="nf nf-md-wifi_strength_4"></i>;
      } else if (
        output.network.defaultGateway?.signalStrength >= 65
      ) {
        return <i class="nf nf-md-wifi_strength_3"></i>;
      } else if (
        output.network.defaultGateway?.signalStrength >= 40
      ) {
        return <i class="nf nf-md-wifi_strength_2"></i>;
      } else if (
        output.network.defaultGateway?.signalStrength >= 25
      ) {
        return <i class="nf nf-md-wifi_strength_1"></i>;
      } else {
        return <i class="nf nf-md-wifi_strength_outline"></i>;
      }
    default:
      return (
        <i class="nf nf-md-wifi_strength_off_outline"></i>
      );
  }
}

// Get icon to show for how much of the battery is charged.
export function getBatteryIcon(output) {
  if (output.battery.chargePercent > 90)
    return <i class="nf nf-fa-battery_4"></i>;
  if (output.battery.chargePercent > 70)
    return <i class="nf nf-fa-battery_3"></i>;
  if (output.battery.chargePercent > 40)
    return <i class="nf nf-fa-battery_2"></i>;
  if (output.battery.chargePercent > 20)
    return <i class="nf nf-fa-battery_1"></i>;
  return <i class="nf nf-fa-battery_0"></i>;
}

// Get icon to show for current weather status.
export function getWeatherIcon(output) {
  switch (output.weather.status) {
    case 'clear_day':
      return <i class="nf nf-weather-day_sunny"></i>;
    case 'clear_night':
      return <i class="nf nf-weather-night_clear"></i>;
    case 'cloudy_day':
      return <i class="nf nf-weather-day_cloudy"></i>;
    case 'cloudy_night':
      return <i class="nf nf-weather-night_alt_cloudy"></i>;
    case 'light_rain_day':
      return <i class="nf nf-weather-day_sprinkle"></i>;
    case 'light_rain_night':
      return <i class="nf nf-weather-night_alt_sprinkle"></i>;
    case 'heavy_rain_day':
      return <i class="nf nf-weather-day_rain"></i>;
    case 'heavy_rain_night':
      return <i class="nf nf-weather-night_alt_rain"></i>;
    case 'snow_day':
      return <i class="nf nf-weather-day_snow"></i>;
    case 'snow_night':
      return <i class="nf nf-weather-night_alt_snow"></i>;
    case 'thunder_day':
      return <i class="nf nf-weather-day_lightning"></i>;
    case 'thunder_night':
      return <i class="nf nf-weather-night_alt_lightning"></i>;
  }
}
