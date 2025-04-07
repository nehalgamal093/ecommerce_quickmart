class Cities {
  List<String> getProvinceNames() {
    return [
      'Ontario',
      'Quebec',
      'British Columbia',
      'Alberta',
      'Manitoba',
      'Saskatchewan',
      'Nova Scotia',
      'New Brunswick',
      'Newfoundland and Labrador',
      'Prince Edward Island'
    ];
  }
  Map<String, List<String>> getCitiesByProvince() {
    return {
      'Ontario': ['Toronto', 'Ottawa', 'Mississauga', 'Hamilton'],
      'Quebec': ['Montreal', 'Quebec City', 'Laval', 'Gatineau'],
      'British Columbia': ['Vancouver', 'Victoria', 'Surrey', 'Burnaby'],
      'Alberta': ['Calgary', 'Edmonton', 'Red Deer', 'Lethbridge'],
      'Manitoba': ['Winnipeg', 'Brandon', 'Steinbach'],
      'Saskatchewan': ['Saskatoon', 'Regina', 'Prince Albert'],
      'Nova Scotia': ['Halifax', 'Sydney', 'Dartmouth'],
      'New Brunswick': ['Moncton', 'Saint John', 'Fredericton'],
      'Newfoundland and Labrador': ['St. John\'s', 'Corner Brook', 'Gander'],
      'Prince Edward Island': ['Charlottetown', 'Summerside']
    };
  }
}