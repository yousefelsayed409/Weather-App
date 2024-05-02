class Astro {
  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;
  final String? moonPhase;
  final String? moonIllumination;
  final num? isMoonUp;
  final num? isSunUp;

  const Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
        sunrise: json['sunrise']?.toString(),
        sunset: json['sunset']?.toString(),
        moonrise: json['moonrise']?.toString(),
        moonset: json['moonset']?.toString(),
        moonPhase: json['moon_phase']?.toString(),
        moonIllumination: json['moon_illumination']?.toString(),
        isMoonUp: json['is_moon_up'] as num?,
        isSunUp: json['is_sun_up'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'sunrise': sunrise,
        'sunset': sunset,
        'moonrise': moonrise,
        'moonset': moonset,
        'moon_phase': moonPhase,
        'moon_illumination': moonIllumination,
        'is_moon_up': isMoonUp,
        'is_sun_up': isSunUp,
      };
}
